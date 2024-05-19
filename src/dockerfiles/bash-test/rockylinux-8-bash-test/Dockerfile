# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/rockylinux-8-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="test"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Copy image setup scripts
COPY --chmod=700 helpers/bash-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-batscore" && \
    "${CNT64_INSTALLER_ROOT}/install-yq"

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
