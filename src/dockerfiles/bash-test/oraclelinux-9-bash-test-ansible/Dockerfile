# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"
ENV CNT64_USER="test"

#
# Setup image
#

# Install applications
RUN \
    sudo -E -H -u ${CNT64_USER} ${CNT64_INSTALLER_ROOT}/install-ansible
