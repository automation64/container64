# Base image
FROM docker.io/library/oraclelinux:9

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_SYSADMIN_USER="sysadmin"

# Copy image setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-toolbox64/image-setup /image-setup
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
COPY toolbox64/* ${CNT64_SYSADMIN_BIN}/

# Set default user to sysadmin
USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
