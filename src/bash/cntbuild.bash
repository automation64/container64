#
###[ embedded-bashlib64-end ]#####################
#

function cntbuild_build_login() {

  if [[ "$engine" == 'podman' ]]; then
    "$DEVCNT_CMD_PODMAN" \
      login \
      --username "$DEVCNT_GITHUB_USER" \
      --password "$DEVCNT_GITHUB_TOKEN" \
      "$DEVCNT_REGISTRY"
  else
    "$DEVCNT_CMD_PODMAN" \
      login \
      --username "$DEVCNT_GITHUB_USER" \
      --password "$DEVCNT_GITHUB_TOKEN" \
      "$DEVCNT_REGISTRY"
  fi

}

function cntbuild_build_build() {

  local engine="$1"
  local debug="$2"
  local container="$3"
  local version="${4:-0.1.0}"
  local dockerfile="dockerfiles/${container}/Dockerfile"

  bl64_check_file "${DEVCNT_SRC}/${dockerfile}" || return 1

  cd "${DEVCNT_SRC}" || return 1

  if [[ "$engine" == 'podman' ]]; then
    "$DEVCNT_CMD_PODMAN" \
      --log-level="$debug" \
      build \
      --no-cache \
      --rm \
      --tag "${container}:${version}" \
      --file "$dockerfile" \
      .
  else
    "$DEVCNT_CMD_DOCKER" \
      --log-level="$debug" \
      build \
      --no-cache \
      --rm \
      --tag "${container}:${version}" \
      --file "$dockerfile" \
      .
  fi

}

function cntbuild_build_publish() {

  local engine="$1"
  local debug="$2"
  local container="$3"
  local version="${4:-0.1.0}"
  local dockerfile="dockerfiles/${container}/Dockerfile"

  bl64_check_file "${DEVCNT_SRC}/${dockerfile}" || return 1

  cntbuild_build_login "$engine" || return 1

  if [[ "$engine" == 'podman' ]]; then
    "$DEVCNT_CMD_PODMAN" \
      --log-level="$debug" \
      push \
      "localhost/${container}:${version}" \
      "${DEVCNT_REGISTRY}/${container}:${version}"
  else
    "$DEVCNT_CMD_DOCKER" \
      --log-level="$debug" \
      push \
      "${DEVCNT_REGISTRY}/${container}:${version}"
  fi

}

function cntbuild_build_check() {

  bl64_check_export 'DEVCNT_REGISTRY' || return 1
  if [[ "$cntbuild_engine" == 'podman' ]]; then
    bl64_check_command "$DEVCNT_CMD_PODMAN" || return 1
  else
    bl64_check_command "$DEVCNT_CMD_DOCKER" || return 1
  fi

}

function cntbuild_build_help() {

  bl64_msg_show_usage \
    '<-b|-u> [-p|-d] [-g] <-c Container> <-e Version> [-h]' \
    'Build containers in dev environment' \
    '
  -b          : Build container
  -u          : Publish container to public registry
    ' '
  -p          : Use podman
  -d          : Use docker
  -g          : Enable debug
  -h          : Show help
    ' '
  -c Container: container name
  -e Version  : container version
    '

}

#
# Main
#

declare cntbuild_status=1
declare cntbuild_command_tag=''
declare cntbuild_command=''
declare cntbuild_option=''
declare cntbuild_container=''
declare cntbuild_version=''
declare cntbuild_engine=''
declare cntbuild_debug='info'

(($# == 0)) && cntbuild_build_help && exit 1
while getopts ':bugpdc:e:h' cntbuild_option; do
  case "$cntbuild_option" in
  b)
    cntbuild_command='cntbuild_build_build'
    cntbuild_command_tag='build container'
    ;;
  u)
    cntbuild_command='cntbuild_build_publish'
    cntbuild_command_tag='publish images to external registry'
    ;;
  p) cntbuild_engine='podman' ;;
  d) cntbuild_engine='docker' ;;
  g) cntbuild_debug='debug' ;;
  c) cntbuild_container="$OPTARG" ;;
  e) cntbuild_version="$OPTARG" ;;
  h) cntbuild_build_help && exit ;;
  \?) cntbuild_build_help && exit 1 ;;
  esac
done
[[ -z "$cntbuild_command" ]] && cntbuild_build_help && exit 1
cntbuild_build_check || exit 1

bl64_msg_show_batch_start "$cntbuild_command_tag"
case "$cntbuild_command" in
'cntbuild_build_build' | 'cntbuild_build_publish')
  "$cntbuild_command" "$cntbuild_engine" "$cntbuild_debug" "$cntbuild_container" "$cntbuild_version"
  ;;
esac
cntbuild_status=$?

bl64_msg_show_batch_finish $cntbuild_status "$cntbuild_command_tag"
exit $cntbuild_status
