# Base image
FROM docker.io/library/fedora:33

# Image Metadata
LABEL \
    container64.os-name="fedora" \
    container64.os-version="33.0" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare package installer
ENV container="docker"
ENV LC_ALL="C"
RUN dnf makecache

# Define requirements for application: SYSTEMD
ENV APP_SYSTEMD_PREREQS1="acl dbus device-mapper hwdata pciutils rdma-core xkeyboard-config diffutils"
ENV APP_SYSTEMD_PREREQS2="kbd-legacy kbd-misc  diffutils kbd libxkbcommon"

# Define packages for application: SYSTEMD
ENV APP_SYSTEMD_PACKAGES="systemd systemd-pam systemd-rpm-macros systemd-networkd"

# Install packages for the application: SYSTEMD
RUN dnf --color=never --nodocs -y install $APP_SYSTEMD_PREREQS1 $APP_SYSTEMD_PREREQS2 $APP_SYSTEMD_PACKAGES

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup package manager
RUN dnf clean all

# Final command
CMD ["/lib/systemd/systemd"]
