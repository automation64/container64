# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_USER="sysadmin"
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"
ARG CNT64_DEBUG=""

# Copy image setup script
COPY helper-toolbox-ansible/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Install tools
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible_2

USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash" ]
