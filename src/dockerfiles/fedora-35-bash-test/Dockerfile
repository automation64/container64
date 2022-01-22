# Base image
FROM docker.io/library/fedora:35

# Image Metadata
LABEL \
    container64.os-name="fedora" \
    container64.os-version="35.0" \
    container64.image-version="0.1.0" \
    container64.image-content="bash,bats-core"

# Prepare package installer
ENV container="docker"

# Download BashLib64
ADD https://raw.githubusercontent.com/serdigital64/container64/master/src/loader/cmd /

# Download Bats-Core
ADD https://github.com/bats-core/bats-core/archive/refs/tags/v1.5.0.tar.gz /opt/

# Install tools
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_pkg_prepare && \
    /cmd bl64_pkg_install sudo

# Install test environment
RUN \
    /usr/sbin/useradd -m test && \
    /cmd bl64_sudo_add_root test && \
    /bin/mkdir /test && \
    /cmd bl64_arc_open_tar /opt/v1.5.0.tar.gz /opt

# Cleanup
RUN /cmd bl64_os_cleanup_full

# Test is a volume where all your bats-core tests are
CMD [ "/test" ]

# Run bats-core against /test
USER test
ENTRYPOINT [ "/opt/bats-core-1.5.0/bin/bats" ]
