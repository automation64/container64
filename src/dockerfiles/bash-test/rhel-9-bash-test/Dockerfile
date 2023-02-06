# Base image
FROM docker.io/redhat/ubi9

# Image Metadata
LABEL \
    container64.os-name="rhel" \
    container64.os-version="9" \
    container64.image-version="0.1.0" \
    container64.image-content="bash,bats-core" \
    org.opencontainers.image.description="Purpose: Bash scripts testing - Packages: Bash, Bats Core, Bash Core plugins, OS utilities"

# Prepare package installer
ENV container="docker"

# Provision setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-bash-test/image-setup /image-setup

# Define environment
ARG CNT64_TEST_USER="test"
ARG CNT64_BATSCORE_VOLUME="/test"
ARG CNT64_HELPERS="sudo git hostname diffutils wget python3 python3-pip python3-setuptools unzip"
ARG CNT64_BATSCORE_REPO="https://github.com/bats-core"
ARG CNT64_BATSCORE_COMPONENT_PATH="/opt"

# Install tools
RUN \
    chmod 700 /image-setup && \
    /image-setup && \
    rm /image-setup /bashlib64.bash

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_TEST_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
