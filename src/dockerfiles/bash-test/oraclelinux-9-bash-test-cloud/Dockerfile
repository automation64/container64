# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

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

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_PYTHON_DEVELOPMENT="YES"

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-gcloud" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-awscli"
