# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"
ENV CNT64_USER="sysadmin"

#
# Setup image
#

# Install applications
RUN \
    sudo -E -H -u ${CNT64_USER} ${CNT64_INSTALLER_ROOT}/install-ansible
