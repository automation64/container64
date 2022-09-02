# Base image
FROM ghcr.io/serdigital64/oraclelinux-8-toolbox:latest

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8" \
    container64.image-version="0.1.0" \
    container64.image-content="toolbox-cloud" \
    org.opencontainers.image.description="Purpose: provide common OS management tools for administration/setup/troubleshooting tasks. Includes AWS CLI"

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"

# Install tools
RUN sudo ${CNT64_SYSADMIN_BIN}/toolbox64_install_aws_cli_2

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
