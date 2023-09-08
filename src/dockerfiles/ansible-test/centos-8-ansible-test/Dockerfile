# Base image
FROM ghcr.io/automation64/bash-test/centos-8-bash-test:latest

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

# Copy image setup script
COPY helpers/ansible-test/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Copy image setup script
COPY helpers/toolbox-ansible/setup /setup

# Set setup parameters
ENV CNT64_ANSIBLE_USER="ansible"
ENV CNT64_ANSIBLE_HOME="${CNT64_OPT_ROOT}/ansible"

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Update installers
COPY installer/* ${CNT64_INSTALLER_ROOT}/

# Install applications
RUN \
    sudo -E -H -u ${CNT64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
