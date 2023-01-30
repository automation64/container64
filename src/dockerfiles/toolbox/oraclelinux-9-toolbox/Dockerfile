# Base image
FROM docker.io/library/oraclelinux:9

# Prepare package installer
ENV container="docker"

# Provision setup script
COPY helper-toolbox64/image-setup /image-setup

# Define environment
ARG CNT64_SYSADMIN_USER="sysadmin"
ARG CNT64_SYSADMIN_ENV="/toolbox64.env"
ARG CNT64_SYSADMIN_HOME="/sa"
ARG CNT64_SYSADMIN_TMP="/sa/tmp"
ARG CNT64_SYSADMIN_LIB="/sa/lib"
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG CNT64_SYSADMIN_VAR="/sa/var"
ARG CNT64_TOOLS="sudo git tar hostname wget unzip bzip2 diffutils python3 python3-pip python3-setuptools"

# Create base structure
RUN \
    chmod 700 /image-setup && \
    mkdir \
        ${CNT64_SYSADMIN_HOME} \
        ${CNT64_SYSADMIN_TMP} \
        ${CNT64_SYSADMIN_LIB} \
        ${CNT64_SYSADMIN_BIN} \
        ${CNT64_SYSADMIN_VAR}

# Copy provisioning scripts
COPY loader/bashlib64.bash ${CNT64_SYSADMIN_LIB}
COPY helper-toolbox64/bin/* ${CNT64_SYSADMIN_BIN}/

# Install tools
RUN /image-setup

# Cleanup
RUN rm /image-setup

USER ${CNT64_SYSADMIN_USER}
ENTRYPOINT [ "/bin/bash" ]
