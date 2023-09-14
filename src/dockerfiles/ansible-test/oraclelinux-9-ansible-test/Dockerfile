# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Copy image setup script
COPY helpers/ansible-test/setup /setup

# Set setup parameters
ENV CNT64_ANSIBLE_USER="ansible"
ENV CNT64_ANSIBLE_HOME="${CNT64_OPT_ROOT}/ansible"
ENV CNT64_ANSIBLE_VERSIONS="2.10 2.11 2.12 2.13 2.14 2.15"

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Set installer parameters
ENV INST64_ANSIBLE_PIPX="OFF"

# Install applications
RUN \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.10" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.11" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.12" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.13" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.14" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E -H -u "${CNT64_ANSIBLE_USER}-2.15" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo sh -c 'find /opt/ansible-2.1? -type d -exec chmod "o+rx,g+rx" "{}" \;' && \
    sudo sh -c 'find /opt/ansible-2.1? -type f -exec chmod "o+r,g+r" "{}" \;'
# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
