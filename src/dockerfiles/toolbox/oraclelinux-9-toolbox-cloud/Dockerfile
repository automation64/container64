# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_USER="sysadmin"
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""

# Install tools
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-aws_cli_2 && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-gcloud

USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash" ]
