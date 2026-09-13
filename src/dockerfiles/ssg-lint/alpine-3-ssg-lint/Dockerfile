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
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_MKDOCS_METHOD="PIPX"
ARG PATH="/bin:/usr/bin:/usr/local/bin:/home/${CNT64_USER}/bin:/home/${CNT64_USER}/.local/bin"

# Install applications
RUN \
    "${CNT64_INST64_PATH}/install-python" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-pipx" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-mkdocs"

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
