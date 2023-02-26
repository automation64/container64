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
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_helm_3

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
