# Base image
FROM ghcr.io/serdigital64/bash-test/oraclelinux-9-bash-test:latest

# Define environment
ARG TOOLBOX64_DEBUG=""
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG CNT64_TEST_USER="test"

# Setup image / Docker
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_docker

# Run bats-core against /test
CMD [ "/test" ]
USER ${CNT64_TEST_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
