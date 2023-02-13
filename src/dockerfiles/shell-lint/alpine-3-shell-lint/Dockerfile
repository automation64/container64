# Base image
FROM ghcr.io/serdigital64/bash-test/alpine-3-bash-test:latest

# Define environment
ARG CNT64_SYSADMIN_BIN="/sa/bin"
ARG TOOLBOX64_DEBUG=""
ARG CNT64_LINT_USER="linter"

# Copy image setup script
COPY helper-shell-lint/image-setup /image-setup

# Setup image
RUN \
    sudo -E /image-setup && \
    sudo rm /image-setup

# Setup image / shellcheck
RUN \
    sudo -E ${CNT64_SYSADMIN_BIN}/toolbox64_install_shellcheck

# Run shellcheck against /src
USER ${CNT64_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
