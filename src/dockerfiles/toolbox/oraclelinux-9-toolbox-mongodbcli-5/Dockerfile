# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/cnt64"

#
# Setup image
#

# Update installers
COPY installer/* ${CNT64_INSTALLER_ROOT}/

# Set installer parameters
ENV CNT64_MONGODBCLI_VERSION="5"

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-mongodbcli
