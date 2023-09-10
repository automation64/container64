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
ENV CNT64_USER="sysadmin"
ENV CNT64_TMP="/tmp"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/cnt64"
ENV CNT64_LOCAL_ROOT="/usr/local"
ENV CNT64_LOCAL_BIN="${CNT64_LOCAL_ROOT}/bin"
ENV CNT64_BASHLIB64="${CNT64_OPT_ROOT}/bl64/bashlib64.bash"

#
# Bootstrap image
#

# Copy image setup scripts
COPY helpers/bootstrap/bootstrap /bootstrap
COPY helpers/toolbox/setup /setup
COPY installer/install-bashlib64 /install-bashlib64

# Bootstrap
RUN \
    chmod 700 /install-bashlib64 /bootstrap /setup && \
    /install-bashlib64 && \
    /bootstrap && \
    rm /install-bashlib64 /bootstrap

#
# Setup image
#

COPY installer/* ${CNT64_INSTALLER_ROOT}/
RUN \
    /setup && \
    rm /setup

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash" ]
