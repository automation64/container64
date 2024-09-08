# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/kalilinux-latest-base:latest

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

# Copy image setup scripts
COPY --chmod=700 helpers/pen-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
