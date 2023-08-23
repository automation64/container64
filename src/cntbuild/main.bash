#
# Main
#

declare cntbuild_status=1
declare cntbuild_debug="$BL64_DBG_TARGET_NONE"
declare cntbuild_verbose="$BL64_MSG_VERBOSE_APP"
declare cntbuild_option=''
declare cntbuild_command="$BL64_VAR_NULL"
declare cntbuild_container=''
declare cntbuild_tag='0.1.0'
declare cntbuild_context=''
cntbuild_context="$(pwd)/src"

(($# == 0)) && cntbuild_help && exit 1
while getopts ':bulnc:e:o:V:D:h' cntbuild_option; do
  case "$cntbuild_option" in
  b) cntbuild_command='cntbuild_build' ;;
  u) cntbuild_command='cntbuild_publish' ;;
  l) cntbuild_command='cntbuild_list' ;;
  n) cntbuild_command='cntbuild_open' ;;
  c) cntbuild_container="$OPTARG" ;;
  e) cntbuild_tag="$OPTARG" ;;
  o) cntbuild_context="$OPTARG" ;;
  V) cntbuild_verbose="$OPTARG" ;;
  D) cntbuild_debug="$OPTARG" ;;
  h) cntbuild_help && exit 0 ;;
  *) cntbuild_help && exit 1 ;;
  esac
done
bl64_dbg_set_level "$cntbuild_debug" && bl64_msg_set_level "$cntbuild_verbose" || exit $?
cntbuild_initialize "$cntbuild_command" || exit $?

bl64_msg_show_batch_start "$cntbuild_command"
case "$cntbuild_command" in
'cntbuild_build' | 'cntbuild_publish' | 'cntbuild_open') "$cntbuild_command" "$cntbuild_container" "$cntbuild_tag" "$cntbuild_context" ;;
'cntbuild_list') "$cntbuild_command" "$cntbuild_context" ;;
*) bl64_check_show_undefined "$cntbuild_command" ;;
esac
cntbuild_status=$?

bl64_msg_show_batch_finish $cntbuild_status "$cntbuild_command"
exit $cntbuild_status
