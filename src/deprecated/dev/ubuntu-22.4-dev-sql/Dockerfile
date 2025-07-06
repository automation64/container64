# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_PGADMIN_METHOD="PIPX"
ARG PATH="/bin:/usr/bin:/usr/local/bin:/home/${CNT64_USER}/bin:/home/${CNT64_USER}/.local/bin"

# Install applications
RUN \
    ${CNT64_INSTALLER_ROOT}/install-pgcli && \
    ${CNT64_INSTALLER_ROOT}/install-pgadmin
