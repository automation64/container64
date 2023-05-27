# Base image
FROM ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox-cloud:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""

# Install tools
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.22 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.23 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.24 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.25 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.26 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_kubectl 1.27 && \
    sudo ln -s /usr/local/bin/kubectl-1.27.0 /usr/local/bin/kubectl && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_k8s_tools && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_helm_3

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
