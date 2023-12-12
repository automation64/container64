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

# Copy image setup script
COPY helpers/toolbox-k8s/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-istioctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-k9s" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubectl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubescape" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-pluto" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-popeye" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-trivy" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-vaultcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeseal" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-krew" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-stern" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-ksniff" && \
    sudo -E -u "${CNT64_USER}" /bin/bash --login -c "${CNT64_INSTALLER_ROOT}/install-kubepug"
