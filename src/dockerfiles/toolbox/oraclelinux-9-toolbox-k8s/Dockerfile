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

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-eksctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-istioctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-k9s" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeconform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubectl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubelinter" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubent" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubescape" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeseal" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-pluto" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-popeye" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-trivy" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-vaultcli" && \
    sudo -E -u "${CNT64_USER}" -H "${CNT64_INSTALLER_ROOT}/install-krew" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-stern" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-ksniff" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-kubepug"
