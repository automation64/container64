# Base image
FROM docker.io/library/oraclelinux:9

# Prepare package installer
ENV container="docker"

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_DEBUG=""
ENV CNT64_USER="test"
ENV CNT64_TMP="/tmp"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"
ENV CNT64_LOCAL_ROOT="/usr/local"
ENV CNT64_LOCAL_BIN="${CNT64_LOCAL_ROOT}/bin"
ENV CNT64_BASHLIB64="${CNT64_OPT_ROOT}/bl64"

#
# Bootstrap image
#

# Copy image setup scripts
COPY helpers/bootstrap/bootstrap /bootstrap
COPY helpers/bash-test/setup /setup
COPY installer/install-installer64 /install-installer64

# Bootstrap
RUN \
    chmod 700 /install-installer64 /bootstrap /setup && \
    /install-installer64 && \
    "${CNT64_INSTALLER_ROOT}/install-bashlib64" && \
    /bootstrap && \
    rm /install-installer64 /bootstrap

#
# Setup image
#

RUN \
    /setup && \
    rm /setup

# Install applications
RUN \
    ${CNT64_INSTALLER_ROOT}/install-batscore

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
