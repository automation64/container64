# Base image
FROM docker.io/library/alpine:3

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG CNT64_LINT_USER="linter"

# Copy image setup script
COPY loader/bashlib64.bash /bashlib64.bash
COPY helper-shell-lint/image-setup /image-setup
COPY helper-toolbox64/bootstrap /bootstrap

# Setup image / bootstrap
RUN \
    apk add bash && \
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
    ${CNT64_SYSADMIN_BIN}/toolbox64_install_shellcheck

# Run shellcheck against /src
USER ${CNT64_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
