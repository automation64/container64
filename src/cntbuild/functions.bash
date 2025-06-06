#
# Functions
#

function cntbuild_list() {
  bl64_dbg_app_show_function "$@"
  local context="$1"
  local target=''

  bl64_check_parameter 'context' &&
    bl64_check_directory "${context}/${CNTBUILD_DOCKERFILE_SOURCES}" || return $?

  target="${context}/${CNTBUILD_DOCKERFILE_SOURCES}"
  bl64_msg_show_task "List container images available in the current context (${target})"
  # shellcheck disable=SC2164
  cd "$target"

  # shellcheck disable=SC2086
  bl64_fs_run_find . \
    $BL64_FS_SET_FIND_TYPE_FILE \
    $BL64_FS_SET_FIND_NAME 'Dockerfile' \
    $BL64_FS_SET_FIND_PRINT
}

function cntbuild_build() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local context="$2"
  local tag="$3"
  local -a command_line
  local -a labels_version
  local -i labels_index=0
  local labels_file=''
  local labels_record=''
  local target=''

  bl64_check_parameter 'container' &&
    bl64_check_parameter 'context' ||
    return $?

  labels_file="${context}/${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_METADATA_FILE}"
  if [[ -f "$labels_file" ]]; then
    bl64_dbg_app_show_info "get container labels (${labels_file})"
    IFS=$'\n'
    for labels_record in $(<"${labels_file}"); do
      unset IFS
      # shellcheck disable=SC2004
      command_line[${labels_index}]="--label=$labels_record"
      labels_index=$((labels_index + 1))

      # Extract the container version if provided
      if [[ "$labels_record" =~ org.opencontainers.image.version=.* ]]; then
        # shellcheck disable=SC2206
        IFS='=' labels_version=($labels_record)
        tag=${labels_version[1]}
      fi

    done
    bl64_dbg_app_show_info "labels: ${command_line[*]}"
  fi
  if [[ -z "$tag" ]]; then
    bl64_msg_show_error "unable to determine container tag from labels file. Specify one either by using the labels file or the -e parameter (${labels_file})"
    return 1
  fi

  target="${container}:${tag}"
  bl64_msg_show_task "Build container image (${target})"
  bl64_cnt_build \
    "$context" \
    "${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_DOCKERFILE_NAME}" \
    "$target" \
    "${command_line[@]}"
}

function cntbuild_open() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local context="$2"
  local tag="$3"
  local target=''

  bl64_check_parameter 'container' &&
    bl64_check_parameter 'context' ||
    return $?

  tag="$(cntbuild_get_version "$container" "$context" "$tag")" || return $?
  target="${container}:${tag}"
  bl64_msg_show_task "open shell in container image ($target})"
  bl64_cnt_run_sh "$target"
}

function cntbuild_delete_github() {
  local container="$1"
  local tag="$2"
  local api_path="/orgs/${CNTBUILD_REGISTRY_OWNER}/packages/container"
  local api_query=''
  local token=''
  local target="${container}${tag:+:}${tag}"

  api_query="/$(bl64_api_url_encode "$target")"
  bl64_msg_show_task "delete container image from GitHub registry ($target})"
  token="$("$CNTBUILD_GHCLI_BIN" auth token)"
  bl64_vcs_github_run_api \
    "$api_path" \
    "$BL64_API_METHOD_DELETE" \
    "$api_query" \
    "$token"
}

function cntbuild_delete() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local tag="$2"

  bl64_check_parameter 'container' ||
    return $?

  case "$CNTBUILD_REGISTRY" in
  ghcr.io | ghcr.io/*)
    cntbuild_delete_github "$container" "$tag"
    ;;
  *)
    bl64_msg_show_error "Unsupported registry API (${CNTBUILD_REGISTRY})"
    return 1
    ;;
  esac
}

function cntbuild_publish() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local context="$2"
  local tag="$3"
  local sign="$4"
  local target=''
  local digest=''
  local -i status=0

  tag="$(cntbuild_get_version "$container" "$context" "$tag")" || return $?
  target="${CNTBUILD_REGISTRY}/${container}:${tag}"
  bl64_msg_show_task "Publish container image to registry (${target})"
  bl64_cnt_tag "${container}:${tag}" "${container}:latest" &&
    bl64_cnt_push "${container}:${tag}" "$target" &&
    bl64_cnt_push "${container}:latest" "${CNTBUILD_REGISTRY}/${container}:latest"
  status=$?
  if ((status == 0)) && bl64_lib_flag_is_enabled "$sign"; then
    bl64_msg_show_task "Sign container image (${target})"
    digest="$(bl64_cnt_cli inspect --format '{{.ID}}' ${target})" &&
      "$CNTBUILD_COSIGN_BIN" \
        sign \
        --yes \
        "${CNTBUILD_REGISTRY}/${container}@${digest}"
    status=$?
  fi
  return $status
}

function cntbuild_reset() {
  bl64_dbg_app_show_function
  local images=''

  bl64_msg_show_task 'remove all local container images'
  images="$(bl64_cnt_cli images -q)"
  # shellcheck disable=SC2086
  [[ -n "$images" ]] && bl64_cnt_cli rmi -f $images

  bl64_msg_show_task 'cleanup docker runtime environment'
  # shellcheck disable=SC2046
  bl64_cnt_cli system prune -a -f

  return 0
}

function cntbuild_get_version() {
  bl64_dbg_app_show_function "@"
  local container="$1"
  local context="$2"
  local tag="$3"
  local labels_file="${context}/${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_METADATA_FILE}"
  local -a labels_version
  local -i labels_index=0
  local labels_record=''

  if [[ -f "$labels_file" ]]; then
    IFS=$'\n'
    for labels_record in $(<"${labels_file}"); do
      unset IFS
      labels_index=$((labels_index + 1))
      if [[ "$labels_record" =~ org.opencontainers.image.version=.* ]]; then
        # shellcheck disable=SC2206
        IFS='=' labels_version=($labels_record)
        echo "${labels_version[1]}"
        break
      fi
    done
  elif [[ -n "$tag" ]]; then
    echo "$tag"
  else
    bl64_msg_show_error "unable to determine container tag from labels file. Specify one either by using the labels file or the -e parameter (${labels_file})"
    return 1
  fi

}

#######################################
# Initialize environment
#
# Arguments:
#   None
# Outputs:
#   Initializacion progress messages
# Returns:
#   0: initialization ok
#   >: failed to initialize
#######################################
function cntbuild_initialize() {
  bl64_dbg_app_show_function

  bl64_check_parameter 'cntbuild_command' ||
    { bl64_msg_help_show && return $BL64_LIB_ERROR_PARAMETER_MISSING; }

  bl64_cnt_setup || return $?

  # shellcheck disable=SC2249
  case "$cntbuild_command" in
  'cntbuild_delete')
    bl64_check_command_search_path "$CNTBUILD_GHCLI_BIN" &&
      bl64_check_export 'CNTBUILD_REGISTRY' &&
      bl64_check_export 'CNTBUILD_REGISTRY_OWNER' ||
      return $?
    ;;
  'cntbuild_publish')
    bl64_check_export 'CNTBUILD_REGISTRY' ||
      return $?
    if bl64_lib_flag_is_enabled; then
      bl64_check_command_search_path "$CNTBUILD_COSIGN_BIN" ||
        return $?
    fi
    ;;
  esac
  return 0
}
