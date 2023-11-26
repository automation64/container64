# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/alpine-3-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="cnt64"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-python" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-mkdocs"

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
