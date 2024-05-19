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

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    "${CNT64_INSTALLER_ROOT}/install-mkdocs"
