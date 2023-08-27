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
ENV CNT64_ROOT="/opt/cnt64"
ENV CNT64_USER="sysadmin"
ENV CNT64_TMP="/tmp"
ENV CNT64_BASHLIB64="/opt/bl64/bashlib64.bash"
ENV CNT64_PUBLIC_ROOT="/usr/local"
ENV CNT64_PUBLIC_BIN="${CNT64_PUBLIC_BIN}/bin"

#
# Bootstrap image
#

# Copy image setup scripts
COPY helper-toolbox/bootstrap /bootstrap
COPY helper-toolbox/setup /setup
COPY installer/install-bashlib64 /install-bashlib64

# Bootstrap
RUN \
    chmod 700 /install-bashlib64 /bootstrap /setup && \
    /install-bashlib64 && \
    /bootstrap && \
    rm /install-bashlib64 /bootstrap

# Setup image
COPY installer/* ${CNT64_ROOT}/
RUN \
    /setup && \
    rm /setup

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash" ]
