# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest

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
    sudo -E "${CNT64_INSTALLER_ROOT}/install-eksctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-releaser" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-tester" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-istioctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-k9s" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubelinter" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeconform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubectl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubescape" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-trivy" && \
    "${CNT64_INSTALLER_ROOT}/install-krew"
