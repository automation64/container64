#
# Main
#

declare cntbuild_debug="$BL64_DBG_TARGET_NONE"
declare cntbuild_verbose="$BL64_MSG_VERBOSE_APP"
declare cntbuild_option=''
declare cntbuild_command="$BL64_VAR_NULL"
declare cntbuild_sign="$BL64_VAR_OFF"
declare cntbuild_container=''
declare cntbuild_tag=''
declare cntbuild_context=''
cntbuild_context="$(pwd)/src"
bl64_lib_script_version_set '3.0.1'
bl64_msg_help_usage_set '<-b|-u|-l|-n|-x|-r> [-c Container] [-e Tag] [-s] [-o Context] [-V Verbose] [-D Debug] [-h]'
bl64_msg_help_about_set 'Container build manager'
# shellcheck disable=SC2016
bl64_msg_help_parameters_set \
  '-b          : Build container
-u          : Publish container to public registry
-l          : List container sources
-n          : Open local container
-x          : Delete container from registry. Supported registries: GitHub
-r          : Reset build environment. Warning: removes local images and containers
-h          : Show help
-s          : Sign container (requires cosign)
-c Container: Container name: Format: base directory where the Dockerfile is. Required for -b, -l, -n
-e Tag      : Container tag. Format: tag. Default: 0.1.0
-o Context  : Build context. Format: full path. Default: PWD/src
-V Verbose  : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
-D Debug    : Enable debugging mode. Format: one of BL64_DBG_TARGET_*'

while getopts ':bulnsrxc:e:o:V:D:h' cntbuild_option; do
  case "$cntbuild_option" in
  b) cntbuild_command='cntbuild_build' ;;
  u) cntbuild_command='cntbuild_publish' ;;
  l) cntbuild_command='cntbuild_list' ;;
  n) cntbuild_command='cntbuild_open' ;;
  x) cntbuild_command='cntbuild_delete' ;;
  r) cntbuild_command='cntbuild_reset' ;;
  c) cntbuild_container="$OPTARG" ;;
  e) cntbuild_tag="$OPTARG" ;;
  o) cntbuild_context="$OPTARG" ;;
  s) cntbuild_sign="$BL64_VAR_ON" ;;
  V) cntbuild_verbose="$OPTARG" ;;
  D) cntbuild_debug="$OPTARG" ;;
  h) bl64_msg_help_show && exit 0 ;;
  *) bl64_msg_help_show && exit 1 ;;
  esac
done
bl64_dbg_set_level "$cntbuild_debug" && bl64_msg_set_level "$cntbuild_verbose" && cntbuild_initialize || exit $?

bl64_msg_show_batch_start "$cntbuild_command"
case "$cntbuild_command" in
'cntbuild_publish') "$cntbuild_command" "$cntbuild_container" "$cntbuild_context" "$cntbuild_tag" "$cntbuild_sign" ;;
'cntbuild_build' | 'cntbuild_open') "$cntbuild_command" "$cntbuild_container" "$cntbuild_context" "$cntbuild_tag" ;;
'cntbuild_list') "$cntbuild_command" "$cntbuild_context" ;;
'cntbuild_delete') "$cntbuild_command" "$cntbuild_container" "$cntbuild_tag" ;;
'cntbuild_reset') "$cntbuild_command" ;;
*) bl64_check_alert_parameter_invalid "$cntbuild_command" ;;
esac
bl64_msg_show_batch_finish $? "$cntbuild_command"
