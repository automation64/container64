# Base image
FROM docker.io/library/oraclelinux:7

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_DEBUG=""
ARG CNT64_USER="test"
ARG CNT64_HELPERS="sudo git tar hostname wget python3 python3-pip python3-setuptools unzip gettext"

# Copy image setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-bash-test/image-setup /image-setup
COPY helper-toolbox/bootstrap /bootstrap

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
COPY toolbox/* ${CNT64_INSTALLER_ROOT}/

# Setup image / bats-core
RUN \
    ${CNT64_INSTALLER_ROOT}/install-batscore

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
