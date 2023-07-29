# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""

# Install tools
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_mongosh_6 && \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_psql 15

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
