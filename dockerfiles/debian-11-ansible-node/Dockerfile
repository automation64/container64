# Base image
FROM docker.io/library/debian:bullseye

# Image Metadata
LABEL \
    container64.os-name="debian" \
    container64.os-version="11.0" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare package installer
ENV container="docker"
ENV LC_ALL="C"
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update

# Define requirements for application: SYSTEMD
ENV APP_SYSTEMD_PREREQS="dbus dmsetup"

# Define packages for application: SYSTEMD
ENV APP_SYSTEMD_PACKAGES="systemd systemd-timesyncd"

# Install packages for the application: SYSTEMD
RUN apt-get -y install $APP_SYSTEMD_PREREQS $APP_SYSTEMD_PACKAGES

# Define requirements for application: SUDO
ENV APP_SUDO_PREREQS=""

# Define packages for application: SUDO
ENV APP_SUDO_PACKAGES="sudo"

# Install packages for the application: SUDO
RUN apt-get -y install $APP_SUDO_PREREQS $APP_SUDO_PACKAGES

# Define requirements for application: PYTHON3
ENV APP_PYTHON3_PREREQS="ca-certificates media-types openssl readline-common"

# Define packages for application: PYTHON3
ENV APP_PYTHON3_PACKAGES="python3 python3-minimal python3.9 python3.9-minimal"

# Install packages for the application: PYTHON3
RUN apt-get -y install $APP_PYTHON3_PREREQS $APP_PYTHON3_PACKAGES

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup package manager
RUN apt-get clean

# Final command
CMD ["/lib/systemd/systemd"]
