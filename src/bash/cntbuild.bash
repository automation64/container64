#
###[ embedded-bashlib64-end ]#####################
#

#
# Globals
#

export CNTBUILD_LOGIN_USER
export CNTBUILD_LOGIN_PASSWORD
export CNTBUILD_LOGIN_URL

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

#
# Main
#

declare cntbuild_status=1
declare cntbuild_command_tag=''
declare cntbuild_command=''
declare cntbuild_option=''
declare cntbuild_container=''
declare cntbuild_version='0.1.0'
declare cntbuild_context=''

cntbuild_setup_globals
(($# == 0)) && cntbuild_help && exit 1
while getopts ':buc:e:o:h' cntbuild_option; do
  case "$cntbuild_option" in
  b)
    cntbuild_command='cntbuild_build'
    cntbuild_command_tag='build container'
    ;;
  u)
    cntbuild_command='cntbuild_publish'
    cntbuild_command_tag='publish images to external registry'
    ;;
  c) cntbuild_container="$OPTARG" ;;
  e) cntbuild_version="$OPTARG" ;;
  o) cntbuild_context="$OPTARG" ;;
  h | \? | *) cntbuild_help && exit 1 ;;
  esac
done
cntbuild_check_requirements || exit 1

bl64_msg_show_batch_start "$cntbuild_command_tag"
case "$cntbuild_command" in
'cntbuild_build') "$cntbuild_command" "$cntbuild_container" "$cntbuild_version" "$cntbuild_context" ;;
'cntbuild_publish') "$cntbuild_command" "$cntbuild_container" "$cntbuild_version" ;;
*) bl64_check_show_undefined "$cntbuild_command" ;;
esac
cntbuild_status=$?

bl64_msg_show_batch_finish $cntbuild_status "$cntbuild_command_tag"
exit $cntbuild_status
