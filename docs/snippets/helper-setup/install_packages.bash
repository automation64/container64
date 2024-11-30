# Snippet: 1.1.0
# X_IMPORTS_PLACEHOLDER_X
  source "${CNT64_BASHLIB64}/bashlib64-module-cryp.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-api.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-vcs.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-xsv.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-bsh.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-vcs.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-rxtx.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-txt.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-fmt.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-fs.bash" &&
  source "${CNT64_BASHLIB64}/bashlib64-module-pkg.bash" &&

# X_FUNCIONS_PLACEHOLDER_X
function cnt64_setup_select_packages() {
  bl64_dbg_app_show_function
  local packages=''
  if bl64_os_is_distro "${X_TARGET_OS_X}"; then
    packages="${packages} X_PACKAGE_LIST_X"
  fi
  [[ -z "$packages" ]] && bl64_msg_show_error 'unable to determine package name' && return 1
  echo "$packages"
}

function cnt64_setup_install_packages() {
  bl64_dbg_app_show_function
  local packages=''
  bl64_msg_show_task 'deploy packages'
  packages="$(cnt64_setup_select_packages)" ||
    return $?
  # shellcheck disable=SC2086
  bl64_pkg_deploy $packages
}

# X_SETUP_PLACEHOLDER_X
  bl64_pkg_setup &&

# X_MAIN_PLACEHOLDER_X
  cnt64_setup_install_packages
