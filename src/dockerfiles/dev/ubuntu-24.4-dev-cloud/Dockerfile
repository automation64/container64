# Base image
FROM ghcr.io/automation64/dev/ubuntu-24.4-dev:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"

# Install applications
RUN \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-update-all && \
    sudo -E "${CNT64_INST64_PATH}/install-awscli" && \
    sudo -E "${CNT64_INST64_PATH}/install-azurecli" && \
    sudo -E "${CNT64_INST64_PATH}/install-gcloud" && \
    sudo -E "${CNT64_INST64_PATH}/install-go" && \
    sudo -E "${CNT64_INST64_PATH}/install-localstack" && \
    "${CNT64_INST64_PATH}/install-awsshell" && \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-cleanup
