# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest

# Define environment
ARG CNT64_DEBUG=""
ARG CNT64_SYSADMIN_TMP='/sa/tmp'
ARG CNT64_INSTALLER_ROOT='/sa/bin'
ARG CNT64_USER="test"
ARG CNT64_HELPERS=""

# Copy image setup script
COPY helper-bash-test/image-setup ${CNT64_SYSADMIN_TMP}/image-setup

# Setup image
RUN \
    sudo chmod 0700 ${CNT64_SYSADMIN_TMP}/image-setup && \
    sudo -E ${CNT64_SYSADMIN_TMP}/image-setup && \
    sudo rm ${CNT64_SYSADMIN_TMP}/image-setup

# Setup image / bats-core
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-batscore

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
