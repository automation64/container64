# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set setup parameters
ARG CNT64_MONGODBCLI_VERSION=6

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-mongodbcli"
