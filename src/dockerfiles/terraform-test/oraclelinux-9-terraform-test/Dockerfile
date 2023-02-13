# Base image
FROM ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox-terraform:latest

# Prepare package installer
ENV container="docker"

# Define environment
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"

# Copy image setup script
COPY helper-terraform-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

USER ${CNT64_TEST_USER}
