# Base image
FROM docker.io/library/oraclelinux:9

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_HOME="/sa"
ARG CNT64_SYSADMIN_TMP="/sa/tmp"
ARG CNT64_SYSADMIN_LIB="/sa/lib"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG CNT64_SYSADMIN_VAR="/sa/var"

# Create base structure
RUN \
    mkdir \
        ${CNT64_SYSADMIN_HOME} \
        ${CNT64_SYSADMIN_TMP} \
        ${CNT64_SYSADMIN_LIB} \
        ${CNT64_SYSADMIN_BIN} \
        ${CNT64_SYSADMIN_VAR}

# Copy image setup script
COPY helper-toolbox64/image-setup /image-setup

# Copy provisioning scripts
COPY loader/bashlib64.bash ${CNT64_SYSADMIN_LIB}
COPY helper-toolbox64/bin/* ${CNT64_SYSADMIN_BIN}/

# Setup image
RUN \
    /image-setup && \
    rm /image-setup

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
