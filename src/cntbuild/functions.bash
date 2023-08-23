#
# Functions
#

function cntbuild_list() {
  bl64_dbg_app_show_function "$@"
  local context="$1"

  bl64_check_parameter 'context' &&
    bl64_check_directory "${context}/${CNTBUILD_DOCKERFILE_SOURCES}" || return $?

  # shellcheck disable=SC2164
  cd "${context}/${CNTBUILD_DOCKERFILE_SOURCES}"

  printf '%s\n' *
}

function cntbuild_build() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local tag="$2"
  local context="$3"
  local labels_file="${context}/${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_METADATA_FILE}"
  local -a command_line
  local -a labels_version
  local -i labels_index=0
  local labels_record=''

  bl64_check_parameter 'container' &&
    bl64_check_parameter 'context' ||
    return $?

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

  bl64_cnt_build \
    "$context" \
    "${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_DOCKERFILE_NAME}" \
    "${container}:${tag}" \
    "${command_line[@]}"
}

function cntbuild_open() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local tag="$2"
  local context="$3"
  # shellcheck disable=SC2178
  local version=''

  bl64_check_parameter 'container' ||
    return $?

  # shellcheck disable=SC2178
  version="$(cntbuild_get_version "$container" "$context")" || return $?
  # shellcheck disable=SC2128
  [[ -n "$version" ]] && tag="$version"

  bl64_cnt_run_sh "${container}:${tag}"
}

function cntbuild_publish() {
  bl64_dbg_app_show_function "$@"
  local container="$1"
  local tag="$2"
  local context="$3"
  # shellcheck disable=SC2178
  local version=''

  bl64_check_export 'CNTBUILD_LOGIN_USER' &&
    bl64_check_export 'CNTBUILD_LOGIN_PASSWORD' &&
    bl64_check_export 'CNTBUILD_LOGIN_URL' ||
    return $?

  version="$(cntbuild_get_version "$container" "$context")" || return $?
  # shellcheck disable=SC2128
  [[ -n "$version" ]] && tag="$version"

  bl64_cnt_login "$CNTBUILD_LOGIN_USER" "$CNTBUILD_LOGIN_PASSWORD" "$CNTBUILD_LOGIN_URL" &&
    bl64_cnt_tag "${container}:${tag}" "${container}:latest" &&
    bl64_cnt_push "${container}:${tag}" "${CNTBUILD_LOGIN_URL}/${container}:${tag}" &&
    bl64_cnt_push "${container}:latest" "${CNTBUILD_LOGIN_URL}/${container}:latest"

}

function cntbuild_get_version() {
  bl64_dbg_app_show_function "@"
  local container="$1"
  local context="$2"
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
  bl64_dbg_app_show_function "@"
  local command="$1"

  bl64_check_parameter 'command' ||
    { cntbuild_help && return 1; }

  bl64_cnt_setup || return $?

  return 0
}

#######################################
# Show script usage description
#
# Arguments:
#   None
# Outputs:
#   Command line format and description
# Returns:
#   0
#######################################
function cntbuild_help() {

  bl64_msg_show_usage \
    '<-b|-u|-l|-n> [-c Container] [-e Tag] [-o Context] [-V Verbose] [-D Debug] [-h]' \
    'Build containers in dev environment' \
    '
  -b          : Build container
  -u          : Publish container to public registry
  -l          : List container sources
  -n          : Open local container
    ' '
  -h          : Show help
    ' "
  -c Container: Container name: Format: base directory where the Dockerfile is. Required for -b, -l, -n
  -e Tag      : Container tag. Format: tag. Default: 0.1.0
  -o Context  : Build context. Format: full path. Default: PWD/src
  -V Verbose  : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
  -D Debug    : Enable debugging mode. Format: one of BL64_DBG_TARGET_*
  "

}
