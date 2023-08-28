# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

# Define environment
ARG CNT64_DEBUG=""
ARG CNT64_INSTALLER_ROOT="/sa/bin"
ARG CNT64_USER="test"

# Setup image / Docker
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-docker

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
