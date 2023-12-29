# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/fedora-39-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="test"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Copy image setup scripts
COPY helpers/bash-test/setup /setup

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
