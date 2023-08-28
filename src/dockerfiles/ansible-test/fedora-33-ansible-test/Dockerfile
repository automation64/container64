# Base image
FROM ghcr.io/automation64/bash-test/fedora-33-bash-test:latest

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"

ARG CNT64_SYSTEMD_PREREQS="acl dbus device-mapper hwdata pciutils rdma-core xkeyboard-config diffutils kbd-legacy kbd-misc  diffutils kbd libxkbcommon"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-pam systemd-rpm-macros systemd-networkd"
ARG CNT64_SUDO_PACKAGES=""
ARG CNT64_PYTHON3_PREREQS=""
ARG CNT64_PYTHON3_PACKAGES=""

# Copy image setup script
COPY helper-ansible-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / Ansible
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible_2

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
