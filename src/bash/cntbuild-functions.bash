#
# Functions
#

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

function cntbuild_publish() {
  bl64_dbg_app_show_function
  local container="$1"
  local version="${2:-0.1.0}"

  bl64_check_export 'CNTBUILD_LOGIN_USER' &&
    bl64_check_export 'CNTBUILD_LOGIN_PASSWORD' &&
    bl64_check_export 'CNTBUILD_LOGIN_URL' ||
    return $?

  bl64_cnt_login "$CNTBUILD_LOGIN_USER" "$CNTBUILD_LOGIN_PASSWORD" "$CNTBUILD_LOGIN_URL" &&
    bl64_cnt_push "${container}:${version}" "${CNTBUILD_LOGIN_URL}/${container}:${version}"

}

function cntbuild_setup_globals() {
  cntbuild_context="$(pwd)/src"
}

function cntbuild_check_requirements() {
  [[ -z "$cntbuild_command" ]] && cntbuild_help && return 1
  return 0
}

function cntbuild_help() {

  bl64_msg_show_usage \
    '<-b|-u> <-c Container> [-e Version] [-o Context] [-h]' \
    'Build containers in dev environment' \
    '
  -b          : Build container
  -u          : Publish container to public registry
    ' '
  -h          : Show help
    ' "
  -c Container: Container name: Format: base directory where the Dockerfile is
  -e Version  : Container version. Format: tag. Default: ${cntbuild_version}
  -o Context  : Build context. Format: full path. Default: ${cntbuild_context}
  "

}

