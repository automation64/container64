# Base image
FROM docker.io/library/ubuntu:21.04

# Image Metadata
LABEL \
    container64.os-name="ubuntu" \
    container64.os-version="21.4" \
    container64.image-version="0.3.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare environment
ENV container="docker"
COPY loader/bashlib64.bash /cmd

# Provision components
ARG BL64_LIB_CMD="1"
ARG CNT64_TEST_USER="test"

ARG CNT64_SYSTEMD_PREREQS="dbus dmsetup gir1.2-glib-2.0 networkd-dispatcher shared-mime-info xdg-user-dirs"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-timesyncd"
ARG CNT64_SUDO_PREREQS=""
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="ca-certificates media-types openssl readline-common tzdata"
ARG CNT64_PYTHON3_PACKAGES="python3 python3-minimal python3.9 python3.9-minimal python3-dbus python3-gi"

RUN /bin/chmod 0755 /cmd && \
    /cmd bl64_pkg_deploy \
        ${CNT64_SYSTEMD_PREREQS} \
        ${CNT64_SYSTEMD_PACKAGES} \
        ${CNT64_SUDO_PREREQS} \
        ${CNT64_SUDO_PACKAGES} \
        ${CNT64_PYTHON3_PREREQS} \
        ${CNT64_PYTHON3_PACKAGES} && \
    /cmd bl64_iam_user_add ${CNT64_TEST_USER} && \
    /cmd bl64_rbac_add_root ${CNT64_TEST_USER}

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup
RUN \
    /cmd bl64_fs_cleanup_full && \
    rm /cmd

# Final command
CMD ["/lib/systemd/systemd"]
