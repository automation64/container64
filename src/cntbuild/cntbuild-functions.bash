#
# Functions
#

function cntbuild_list() {
  bl64_dbg_app_show_function
  local context="$1"

  bl64_check_parameter 'context' &&
    bl64_check_directory "${context}/${CNTBUILD_DOCKERFILE_SOURCES}" || return $?

  # shellcheck disable=SC2164
  cd "${context}/${CNTBUILD_DOCKERFILE_SOURCES}"

  printf '%s\n' *
}

function cntbuild_build() {
  bl64_dbg_app_show_function
  local container="$1"
  local tag="$2"
  local context="$3"
  local labels_file="${context}/${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_METADATA_FILE}"
  local -a command_line
  local -a label_version
  local -i labels_index=0
  local labels_record=''

  bl64_check_parameter 'container' &&
    bl64_check_parameter 'context' ||
    return $?

  # Determine if standard labels are provided
  if [[ -f "$labels_file" ]]; then
    # Load each label and add to the command line
    IFS=$'\n'
    for labels_record in $(<"${labels_file}"); do
      unset IFS
      command_line[${labels_index}]="--label='$labels_record'"
      labels_index=$((labels_index + 1))

      # Extract the container version if provided
      if [[ "$labels_record" =~ org.opencontainers.image.version=.* ]]; then
        IFS='=' label_version=($labels_record)
        tag=${label_version[1]}
      fi

    done
  fi

  bl64_cnt_build "$context" "${CNTBUILD_DOCKERFILE_SOURCES}/${container}/${CNTBUILD_DOCKERFILE_NAME}" "${container}:${tag}" "${command_line[@]}"
}

function cntbuild_open() {
  bl64_dbg_app_show_function
  local container="$1"
  local tag="$2"

  bl64_check_parameter 'container' ||
    return $?

  bl64_cnt_run_sh "${container}:${tag}"
}

function cntbuild_publish() {
  bl64_dbg_app_show_function
  local container="$1"
  local tag="$2"

  bl64_check_export 'CNTBUILD_LOGIN_USER' &&
    bl64_check_export 'CNTBUILD_LOGIN_PASSWORD' &&
    bl64_check_export 'CNTBUILD_LOGIN_URL' ||
    return $?

  bl64_cnt_login "$CNTBUILD_LOGIN_USER" "$CNTBUILD_LOGIN_PASSWORD" "$CNTBUILD_LOGIN_URL" &&
    bl64_cnt_tag "${container}:${tag}" "${container}:latest" &&
    bl64_cnt_push "${container}:${tag}" "${CNTBUILD_LOGIN_URL}/${container}:${tag}" &&
    bl64_cnt_push "${container}:latest" "${CNTBUILD_LOGIN_URL}/${container}:latest"

}

function cntbuild_setup_globals() {
  :
}

function cntbuild_check_requirements() {
  [[ -z "$cntbuild_command" ]] && cntbuild_help && return 1
  return 0
}

function cntbuild_help() {

  bl64_msg_show_usage \
    '<-b|-u|-l|-n> [-c Container] [-e Tag] [-o Context] [-h]' \
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
  "

}
