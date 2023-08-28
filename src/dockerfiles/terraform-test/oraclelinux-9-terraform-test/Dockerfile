# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"

# Copy image setup script
COPY helper-terraform-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / terraform
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-terraform_1

USER ${CNT64_USER}
