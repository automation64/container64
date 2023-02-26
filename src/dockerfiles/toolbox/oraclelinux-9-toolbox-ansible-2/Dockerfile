# Base image
FROM ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"
ARG TOOLBOX64_DEBUG=""

# Copy image setup script
COPY helper-toolbox64-ansible/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Install tools
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_SYSADMIN_BIN}/toolbox64_install_ansible_2

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
