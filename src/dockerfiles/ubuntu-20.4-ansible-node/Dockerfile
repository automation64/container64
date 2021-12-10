# Base image
FROM docker.io/library/ubuntu:20.04

# Image Metadata
LABEL \
    container64.os-name="ubuntu" \
    container64.os-version="20.4" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare package installer
ENV container="docker"
ENV LC_ALL="C"
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update

# Define requirements for application: SYSTEMD
ENV APP_SYSTEMD_PREREQS1="dbus dmsetup gir1.2-glib-2.0 networkd-dispatcher shared-mime-info tzdata xdg-user-dirs"
ENV APP_SYSTEMD_PREREQS2="file mime-support readline-common xz-utils"
ENV APP_SYSTEMD_PREREQS3="python3 python3-dbus python3-gi python3-minimal python3.8 python3.8-minimal"

# Define packages for application: SYSTEMD
ENV APP_SYSTEMD_PACKAGES="systemd systemd-timesyncd"

# Install packages for the application: SYSTEMD
RUN apt-get -y install $APP_SYSTEMD_PREREQS1 $APP_SYSTEMD_PREREQS2 $APP_SYSTEMD_PREREQS3 $APP_SYSTEMD_PACKAGES

# Define requirements for application: SUDO
ENV APP_SUDO_PREREQS=""

# Define packages for application: SUDO
ENV APP_SUDO_PACKAGES="sudo"

# Install packages for the application: SUDO
RUN apt-get -y install $APP_SUDO_PREREQS $APP_SUDO_PACKAGES

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup package manager
RUN apt-get clean

# Final command
CMD ["/lib/systemd/systemd"]
