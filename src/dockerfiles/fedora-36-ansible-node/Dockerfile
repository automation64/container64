# Base image
FROM docker.io/library/fedora:36

# Image Metadata
LABEL \
    container64.os-name="fedora" \
    container64.os-version="36.0" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare environment
ENV container="docker"
COPY loader/bashlib64.bash /cmd

# Provision components
ARG BL64_LIB_CMD="1"
ARG CNT64_TEST_USER="test"

ARG CNT64_SYSTEMD_PREREQS="acl dbus device-mapper hwdata pciutils rdma-core xkeyboard-config diffutils kbd-legacy kbd-misc  diffutils kbd libxkbcommon"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-pam systemd-rpm-macros systemd-networkd"
ARG CNT64_SUDO_PREREQS=""
ARG CNT64_SUDO_PACKAGES=""
ARG CNT64_PYTHON3_PREREQS=""
ARG CNT64_PYTHON3_PACKAGES=""

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
