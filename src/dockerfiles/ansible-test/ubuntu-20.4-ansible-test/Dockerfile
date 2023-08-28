# Base image
FROM ghcr.io/automation64/bash-test/ubuntu-20.4-bash-test:latest

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"

ARG CNT64_SYSTEMD_PREREQS="dbus dmsetup gir1.2-glib-2.0 networkd-dispatcher shared-mime-info tzdata xdg-user-dirs"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-timesyncd"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="file mime-support readline-common xz-utils"
ARG CNT64_PYTHON3_PACKAGES="python3 python3-dbus python3-gi python3-minimal python3.8 python3.8-minimal"

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
