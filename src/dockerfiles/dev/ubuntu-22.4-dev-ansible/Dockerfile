# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set installer parameters
ARG INST64_PYTHON_FLAG_DEVELOPMENT="ON"
ARG INST64_SHELLCHECK_METHOD="BINARY"

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-go" && \
    "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    "${CNT64_INSTALLER_ROOT}/install-ansiblelint"
