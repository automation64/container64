# Base image
FROM ghcr.io/automation64/toolbox/almalinux-10-toolbox-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_KREW_SYSTEM_WIDE="OFF"

# Install applications
RUN \
    sudo -E "${CNT64_INST64_PATH}/install-eksctl" && \
    sudo -E "${CNT64_INST64_PATH}/install-helm" && \
    sudo -E "${CNT64_INST64_PATH}/install-istioctl" && \
    sudo -E "${CNT64_INST64_PATH}/install-k9s" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubeconform" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubectl" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubelinter" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubent" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubescape" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubeseal" && \
    sudo -E "${CNT64_INST64_PATH}/install-pluto" && \
    sudo -E "${CNT64_INST64_PATH}/install-popeye" && \
    sudo -E "${CNT64_INST64_PATH}/install-trivy" && \
    "${CNT64_INST64_PATH}/install-krew" && \
    /bin/bash --login -c "${CNT64_INST64_PATH}/install-stern" && \
    /bin/bash --login -c "${CNT64_INST64_PATH}/install-ksniff" && \
    /bin/bash --login -c "${CNT64_INST64_PATH}/install-kubepug" && \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-cleanup
