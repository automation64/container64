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

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-awscli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-azurecli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-gcloud" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-go" && \
    "${CNT64_INSTALLER_ROOT}/install-localstack" && \
    "${CNT64_INSTALLER_ROOT}/install-awsshell"
