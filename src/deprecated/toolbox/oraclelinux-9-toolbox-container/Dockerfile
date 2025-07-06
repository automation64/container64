# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-cosign" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-crane" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-dockle" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-lazydocker" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-podman"
