# Base image
FROM quay.io/centos/centos:8

# Image Metadata
LABEL \
    container64.os-name="centos" \
    container64.os-version="8.0" \
    container64.image-version="0.2.0" \
    container64.image-content="systemd,sudo,python3"

# Prepare environment
ENV container="docker"
COPY loader/bashlib64.bash /cmd
ARG BL64_LIB_CMD="1"
ARG BL64_LIB_VERBOSE="2"
RUN /bin/chmod 0755 /cmd

# Install packages
ARG CNT64_SYSTEMD_PREREQS="kbd-legacy kbd-misc xkeyboard-config diffutils kbd libxkbcommon"
ARG CNT64_SYSTEMD_PACKAGES="systemd systemd-libs systemd-pam systemd-udev"
ARG CNT64_SUDO_PREREQS=""
ARG CNT64_SUDO_PACKAGES="sudo"
ARG CNT64_PYTHON3_PREREQS="platform-python-pip python3-pip python3-setuptools"
ARG CNT64_PYTHON3_PACKAGES="python36"
RUN \
    dnf --assumeyes --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos && \
    /cmd bl64_pkg_deploy \
        ${CNT64_SYSTEMD_PREREQS} \
        ${CNT64_SYSTEMD_PACKAGES} \
        ${CNT64_SUDO_PREREQS} \
        ${CNT64_SUDO_PACKAGES} \
        ${CNT64_PYTHON3_PREREQS} \
        ${CNT64_PYTHON3_PACKAGES}

# Configure subsystem: systemd
RUN systemctl set-default multi-user.target

# Cleanup
RUN \
    /cmd bl64_os_cleanup_full && \
    rm /cmd

# Final command
CMD ["/lib/systemd/systemd"]
