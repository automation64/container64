# Template: 1.0.0
# Base image
FROM docker.io/library/ubuntu:21.04 AS base

# Prepare package installer
ENV container="docker"

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_DEBUG=""
ENV CNT64_USER="cnt64"
ENV CNT64_TMP="/tmp"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"
ENV CNT64_LOCAL_ROOT="/usr/local"
ENV CNT64_LOCAL_BIN="${CNT64_LOCAL_ROOT}/bin"
ENV CNT64_BASHLIB64="${CNT64_OPT_ROOT}/bl64"

#
# Bootstrap image
#

# Copy image setup scripts
COPY --chmod=700 helpers/bootstrap/bootstrap /bootstrap
ADD --chmod=700 https://raw.githubusercontent.com/automation64/installer64/main/src/install-installer64 /install-installer64

# Bootstrap
RUN \
    sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --assume-yes curl openssl ca-certificates --no-install-recommends && \
    /install-installer64 && \
    "${CNT64_INSTALLER_ROOT}/install-bashlib64" && \
    /bootstrap && \
    rm /install-installer64 /bootstrap
