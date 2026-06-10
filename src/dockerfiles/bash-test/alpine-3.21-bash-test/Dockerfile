# Base image
# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/alpine-3.21-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="test"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Copy image setup scripts
COPY --chmod=700 helpers/bash-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_PYTHON_DEVELOPMENT="YES"

# Install applications
RUN \
    /opt/sysop64/mod/linux-repo/linux-repo-refresh && \
    "${CNT64_INSTALLER_ROOT}/install-python" && \
    "${CNT64_INSTALLER_ROOT}/install-zip" && \
    "${CNT64_INSTALLER_ROOT}/install-git" && \
    "${CNT64_INSTALLER_ROOT}/install-batscore" && \
    "${CNT64_INSTALLER_ROOT}/install-yq" && \
    /opt/sysop64/mod/linux-repo/linux-repo-cleanup

# Run bats-core against /test
CMD [ "/test" ]

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
