# Base image
FROM docker.io/library/oraclelinux:8

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8.0" \
    container64.image-version="0.1.0" \
    container64.image-content="bash,bats-core"

# Prepare package installer
ENV container="docker"

# Download BashLib64
ADD https://raw.githubusercontent.com/serdigital64/container64/master/src/loader/cmd /

# Download Bats-Core
ADD https://github.com/bats-core/bats-core/archive/refs/tags/v1.5.0.tar.gz /opt/

# Install bats-core
RUN \
    /bin/chmod 700 /cmd && \
    /cmd bl64_arc_open_tar /opt/v1.5.0.tar.gz /opt && \
    /bin/mkdir /test

# Cleanup
RUN /cmd bl64_os_cleanup_full

# Test is a volume where all your bats-core tests are
CMD [ "/test" ]

# Run bats-core against /test
ENTRYPOINT [ "/opt/bats-core-1.5.0/bin/bats" ]
