# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.04-dev

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="dev"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/cnt64"

#
# Setup image
#

# Update installers
COPY installer/* ${CNT64_INSTALLER_ROOT}/

# Set setup parameters
ENV CNT64_PYTHON_DEVELOPMENT="1"
ENV CNT64_ANSIBLE_USER="${CNT64_USER}"
ENV CNT64_ANSIBLE_HOME="/home/${CNT64_USER}"

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-python && \
    sudo -E -H -u ${CNT64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible
