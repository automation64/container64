# Base image
FROM ghcr.io/serdigital64/bash-test/ubuntu-22.4-bash-test:latest

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"
ARG CNT64_SYSTEMD_PREREQS="xkeyboard-config diffutils kbd"

ARG CNT64_SYSTEMD_PREREQS="dbus dmsetup gir1.2-glib-2.0 networkd-dispatcher shared-mime-info xdg-user-dirs"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-timesyncd"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="ca-certificates media-types openssl readline-common tzdata"
ARG CNT64_PYTHON3_PACKAGES="python3 python3-minimal python3-dbus python3-gi"

# Copy image setup script
COPY helper-ansible-node/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / Ansible
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_SYSADMIN_BIN}/toolbox64_install_ansible_2

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
