# Base image
FROM ghcr.io/automation64/bash-test/debian-10-bash-test:latest

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"

ARG CNT64_SYSTEMD_PREREQS="dbus dmsetup"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-sysv"
ARG CNT64_SUDO_PACKAGES="sudo" "lsb-base"
ARG CNT64_PYTHON3_PREREQS="bzip2 file mime-support readline-common xz-utils"
ARG CNT64_PYTHON3_PACKAGES="python3 python3-minimal python3.7 python3.7-minimal"

# Copy image setup script
COPY helper-ansible-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / Ansible
RUN \
    sudo -H -E -u ${CNT64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible_2

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
