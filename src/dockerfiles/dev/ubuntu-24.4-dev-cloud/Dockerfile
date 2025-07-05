# Base image
FROM ghcr.io/automation64/dev/ubuntu-24.4-dev:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"

# Install applications
RUN \
    sudo /opt/sysop64/linux-repo/linux-repo-refresh && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-awscli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-azurecli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-gcloud" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-go" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-localstack" && \
    "${CNT64_INSTALLER_ROOT}/install-awsshell" && \
    sudo /opt/sysop64/linux-repo/linux-repo-cleanup
