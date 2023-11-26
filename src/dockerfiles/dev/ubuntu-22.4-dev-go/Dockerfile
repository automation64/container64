# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="cnt64"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-go"
