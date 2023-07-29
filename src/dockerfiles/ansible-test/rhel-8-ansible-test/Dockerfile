# Base image
FROM ghcr.io/automation64/bash-test/rhel-8-bash-test:latest

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"

ARG CNT64_SYSTEMD_PREREQS="kbd-legacy kbd-misc xkeyboard-config diffutils kbd libxkbcommon"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"
ARG CNT64_PYTHON3_PACKAGES="python36"

# Copy image setup script
COPY helper-ansible-test/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / Ansible
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_SYSADMIN_BIN}/toolbox64_install_ansible_2

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
