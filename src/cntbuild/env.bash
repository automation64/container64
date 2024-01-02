#
###[ embedded-bashlib64-end ]#####################
#

#
# Globals
#

# Registry credentials
export CNTBUILD_REGISTRY="${CNTBUILD_REGISTRY:-}"
export CNTBUILD_REGISTRY_OWNER="${CNTBUILD_REGISTRY_OWNER:-}"

# Cosign binary
export CNTBUILD_COSIGN_BIN="${CNTBUILD_COSIGN_BIN:-/usr/local/bin/cosign}"

# GitHub CLI binary
export CNTBUILD_GHCLI_BIN="${CNTBUILD_GHCLI_BIN:-/usr/bin/gh}"

# Metadata filename
export CNTBUILD_METADATA_FILE='Metadata.label'

# Dockerfiles sources directory name
export CNTBUILD_DOCKERFILE_SOURCES='dockerfiles'

# Dockerfile name
export CNTBUILD_DOCKERFILE_NAME='Dockerfile'
