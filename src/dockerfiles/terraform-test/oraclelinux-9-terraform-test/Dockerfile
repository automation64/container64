# Base image
FROM ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox-terraform:latest

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"

# Copy image setup script
COPY helper-terraform-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / terraform
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_terraform_1

USER ${CNT64_TEST_USER}
