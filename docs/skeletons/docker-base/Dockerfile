# Template: 1.0.0
# Base image
FROM X_IMAGE_URI_X

# Prepare package installer
ENV container="docker"

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_DEBUG=""
ARG CNT64_USER="X_CONTAINER_USER_X"
ARG CNT64_TMP="/tmp"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"
ARG CNT64_LOCAL_ROOT="/usr/local"
ARG CNT64_LOCAL_BIN="${CNT64_LOCAL_ROOT}/bin"
ARG CNT64_BASHLIB64="${CNT64_OPT_ROOT}/bl64"

#
# Bootstrap image
#

# Copy image setup scripts
COPY helpers/bootstrap/bootstrap /bootstrap
COPY installer/install-installer64 /install-installer64

# Bootstrap
RUN \
    # X_PLACEHOLDER_BOOTSTRAP_X
    chmod 700 /install-installer64 /bootstrap /setup && \
    /install-installer64 && \
    "${CNT64_INSTALLER_ROOT}/install-bashlib64" && \
    /bootstrap && \
    rm /install-installer64 /bootstrap
