# Base image
FROM docker.io/library/debian:buster

# Image Metadata
LABEL \
    container64.os-name="debian" \
    container64.os-version="10.0" \
    container64.image-version="0.3.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare environment
ENV container="docker"
COPY loader/bashlib64.bash /cmd

# Provision components
ARG BL64_LIB_CMD="1"
ARG CNT64_TEST_USER="test"

ARG CNT64_SYSTEMD_PREREQS="dbus dmsetup"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-sysv"
ARG CNT64_SUDO_PREREQS="lsb-base"
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="bzip2 file mime-support readline-common xz-utils"
ARG CNT64_PYTHON3_PACKAGES="python3 python3-minimal python3.7 python3.7-minimal"

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
