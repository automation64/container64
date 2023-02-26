# Base image
FROM ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8" \
    container64.image-version="0.2.0" \
    container64.image-content="toolbox-psql-13" \
    org.opencontainers.image.description="Purpose: provide common OS management tools for administration/setup/troubleshooting tasks. Includes PostgreSQL cli v13"

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""

# Install tools
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_psql_13

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
