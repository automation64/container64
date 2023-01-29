# Base image
FROM ghcr.io/serdigital64/oraclelinux-9-toolbox-cloud:latest

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="9" \
    container64.image-version="0.1.0" \
    container64.image-content="toolbox-k8s" \
    org.opencontainers.image.description="Purpose: provide common OS management tools for administration/setup/troubleshooting tasks. Includes Cloud and K8S tools"

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_BIN="/sa/bin"

# Install tools
RUN sudo ${CNT64_SYSADMIN_BIN}/toolbox64_install_helm_3

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
