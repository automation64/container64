# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/alpine-3-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set installer parameters
ARG INST64_SHELLCHECK_METHOD="BINARY"

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-shfmt" && \
    "${CNT64_INSTALLER_ROOT}/install-shellcheck"

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/usr/local/bin/shellcheck" ]
