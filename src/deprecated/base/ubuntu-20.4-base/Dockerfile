# Template: 1.0.0
# Base image
FROM docker.io/library/ubuntu:20.04 AS base

# Prepare package installer
ENV container="docker"

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_DEBUG=""
ARG CNT64_USER="cnt64"
ARG CNT64_TMP="/tmp"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"
ARG CNT64_LOCAL_ROOT="/usr/local"
ARG CNT64_LOCAL_BIN="${CNT64_LOCAL_ROOT}/bin"
ARG CNT64_BASHLIB64="${CNT64_OPT_ROOT}/bl64"

#
# Setup image
#

# Set installer parameters
ARG INST64_SYSTEM_WIDE="YES"

#
# Bootstrap image
#

# Copy image setup scripts
COPY --chmod=700 helpers/bootstrap/bootstrap /bootstrap
ADD --chmod=700 https://raw.githubusercontent.com/automation64/installer64/main/src/install-installer64 /install-installer64

# Bootstrap
RUN \
    apt-get update && \
    apt-get install --assume-yes curl openssl ca-certificates --no-install-recommends && \
    /install-installer64 && \
    /bootstrap && \
    "${CNT64_INSTALLER_ROOT}/install-sysop64" && \
    rm /install-installer64 /bootstrap
