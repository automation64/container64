#
# Functions
#

function cntbuild_list() {
  bl64_dbg_app_show_function
  local context="$1"

  bl64_check_parameter 'context' &&
    bl64_check_directory "${context}/dockerfiles" || return $?

  cd "${context}/dockerfiles"

  printf '%s\n' *
}

function cntbuild_build() {
  bl64_dbg_app_show_function
  local container="$1"
  local version="$2"
  local context="$3"

  bl64_check_parameter 'container' &&
    bl64_check_parameter 'context' ||
    return $?

  bl64_cnt_build "$context" "dockerfiles/${container}/Dockerfile" "${container}:${version}"
}

function cntbuild_open() {
  bl64_dbg_app_show_function
  local container="$1"
  local version="$2"

  bl64_check_parameter 'container' ||
    return $?

  bl64_cnt_run_sh "${container}:${version}"
}

function cntbuild_publish() {
  bl64_dbg_app_show_function
  local container="$1"
  local version="${2:-0.1.0}"

  bl64_check_export 'CNTBUILD_LOGIN_USER' &&
    bl64_check_export 'CNTBUILD_LOGIN_PASSWORD' &&
    bl64_check_export 'CNTBUILD_LOGIN_URL' ||
    return $?

  bl64_cnt_login "$CNTBUILD_LOGIN_USER" "$CNTBUILD_LOGIN_PASSWORD" "$CNTBUILD_LOGIN_URL" &&
    bl64_cnt_tag "${container}:${version}" "${container}:latest" &&
    bl64_cnt_push "${container}:${version}" "${CNTBUILD_LOGIN_URL}/${container}:${version}" &&
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
    '<-b|-u|-l|-n> [-c Container] [-e Version] [-o Context] [-h]' \
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
  -e Version  : Container version. Format: tag. Default: 0.1.0
  -o Context  : Build context. Format: full path. Default: PWD/src
  "

}
