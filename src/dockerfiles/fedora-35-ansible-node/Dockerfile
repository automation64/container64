# Base image
FROM docker.io/library/fedora:35

# Image Metadata
LABEL \
    container64.os-name="fedora" \
    container64.os-version="35.0" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare package installer
ENV container="docker"

# Download BashLib64
ADD https://raw.githubusercontent.com/serdigital64/container64/master/src/loader/cmd /

# Install tools
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_pkg_prepare

# Define requirements for application: SYSTEMD
ENV APP_SYSTEMD_PREREQS1="acl dbus device-mapper hwdata pciutils rdma-core xkeyboard-config diffutils"
ENV APP_SYSTEMD_PREREQS2="kbd-legacy kbd-misc  diffutils kbd libxkbcommon"

# Define packages for application: SYSTEMD
ENV APP_SYSTEMD_PACKAGES="systemd systemd-pam systemd-rpm-macros systemd-networkd"

# Install packages for the application: SYSTEMD
RUN /cmd bl64_pkg_install \
    $APP_SYSTEMD_PREREQS1 \
    $APP_SYSTEMD_PREREQS2 \
    $APP_SYSTEMD_PACKAGES

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup
RUN /cmd bl64_os_cleanup_full

# Final command
CMD ["/lib/systemd/systemd"]
