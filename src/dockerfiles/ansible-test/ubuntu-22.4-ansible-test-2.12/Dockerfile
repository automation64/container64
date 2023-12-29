# Base image
FROM ghcr.io/automation64/base/ubuntu-22.4-base:latest

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

# Copy image setup script
COPY helpers/ansible-test/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Set installer parameters
ARG INST64_ANSIBLE_PIPX="OFF"
ARG INST64_ANSIBLE_VERSION="2.12"

# Install applications
RUN \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-ansible"

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
USER ${CNT64_USER}
