# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev:latest

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

RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-awscli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-azurecli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-gcloud" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-releaser" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-tester" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-istioctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubelinter" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeconform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubectl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubescape" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-shellcheck" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-go" && \
    "${CNT64_INSTALLER_ROOT}/install-krew"
