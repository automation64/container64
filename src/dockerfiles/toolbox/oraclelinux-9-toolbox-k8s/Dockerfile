# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_USER="sysadmin"
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""

# Install tools
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.22 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.23 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.24 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.25 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.26 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-kubectl 1.27 && \
    sudo ln -s /usr/local/bin/kubectl-1.27.0 /usr/local/bin/kubectl && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-k8s_tools && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-helm_3

USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash" ]
