# Base image
FROM docker.io/library/oraclelinux:9

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="9" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare environment
ENV container="docker"

# Provision setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-ansible-node/image-setup /image-setup

# Define environment
ARG CNT64_TEST_USER="test"
ARG CNT64_SYSTEMD_PREREQS="xkeyboard-config diffutils kbd"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"
ARG CNT64_SUDO_PREREQS=""
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"
ARG CNT64_PYTHON3_PACKAGES="python39"

# Copy provisioning scripts
COPY loader/bashlib64.bash ${CNT64_SYSADMIN_LIB}

# Setup image
RUN \
    chmod 700 /image-setup && \
    /image-setup && \
    rm /image-setup /bashlib64.bash

# Final command
CMD ["/lib/systemd/systemd"]
