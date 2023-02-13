# Base image
FROM docker.io/library/oraclelinux:9

# Prepare environment
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"
ARG CNT64_ANSIBLE_USER="ansible"
ARG CNT64_ANSIBLE_HOME="/opt/ansible"
ARG CNT64_SYSTEMD_PREREQS="xkeyboard-config diffutils kbd"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"
ARG CNT64_PYTHON3_PACKAGES="python39"

# Copy image setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-ansible-node/image-setup /image-setup
COPY helper-toolbox64/bootstrap /bootstrap

# Setup image / bootstrap
RUN \
    chmod 700 /bootstrap /image-setup && \
    /bootstrap && \
    rm /bootstrap

# Setup image
RUN \
    /image-setup && \
    rm /image-setup /bashlib64.bash

# Copy optional provisioning scripts
COPY helper-toolbox64/bin/* ${CNT64_SYSADMIN_BIN}/

# Setup image / Ansible
RUN \
    sudo -E -u ${CNT64_ANSIBLE_USER} ${CNT64_SYSADMIN_BIN}/toolbox64_install_ansible_2

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
