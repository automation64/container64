# Base Image
FROM docker.io/library/ubuntu:21.04 AS base

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_TEST_USER="test"
ARG CNT64_HELPERS="sudo git wget curl gawk python3 python3-pip python3-venv unzip"

# Copy image setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-bash-test/image-setup /image-setup
COPY helper-toolbox64/bootstrap /bootstrap

# Setup image / bootstrap
RUN \
    chmod 700 /bootstrap /image-setup && \
    /bootstrap && \
    rm /bootstrap

# Setup image
RUN \
    /image-setup && \
    rm /image-setup /bashlib64.bash

# Copy optional provisioning scripts
COPY helper-toolbox64/bin/* ${CNT64_SYSADMIN_BIN}/

# Setup image / bats-core
RUN \
    ${CNT64_SYSADMIN_BIN}/toolbox64_install_batscore

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_TEST_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]