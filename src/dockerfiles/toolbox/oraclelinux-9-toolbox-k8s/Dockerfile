# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set installer parameters
ENV INST64_KUBECTL_VERSION="1.28.0"

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-helm && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-k9s && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-helm-chart-releaser && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubescape && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-istioctl
