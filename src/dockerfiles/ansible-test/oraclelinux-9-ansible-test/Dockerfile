# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"

ARG CNT64_SYSTEMD_PREREQS="xkeyboard-config diffutils kbd"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"
ARG CNT64_PYTHON3_PACKAGES="python39"

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
