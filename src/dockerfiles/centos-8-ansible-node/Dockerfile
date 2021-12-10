# Base image
FROM docker.io/library/centos:8

# Image Metadata
LABEL \
    container64.os-name="centos" \
    container64.os-version="8.0" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare package installer
ENV container="docker"
ENV LC_ALL="C"
RUN dnf makecache

# Define requirements for application: SYSTEMD
ENV APP_SYSTEMD_PREREQS="kbd-legacy kbd-misc xkeyboard-config diffutils kbd libxkbcommon"

# Define packages for application: SYSTEMD
ENV APP_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"

# Install packages for the application: SYSTEMD
RUN dnf --color=never --nodocs -y install $APP_SYSTEMD_PREREQS $APP_SYSTEMD_PACKAGES

# Define requirements for application: SUDO
ENV APP_SUDO_PREREQS=""

# Define packages for application: SUDO
ENV APP_SUDO_PACKAGES="sudo"

# Install packages for the application: SUDO
RUN dnf --color=never --nodocs -y install $APP_SUDO_PREREQS $APP_SUDO_PACKAGES

# Define requirements for application: PYTHON3
ENV APP_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"

# Define packages for application: PYTHON3
ENV APP_PYTHON3_PACKAGES="python36"

# Install packages for the application: PYTHON3
RUN dnf --color=never --nodocs -y install $APP_PYTHON3_PREREQS $APP_PYTHON3_PACKAGES

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup package manager
RUN dnf clean all

# Final command
CMD ["/lib/systemd/systemd"]
