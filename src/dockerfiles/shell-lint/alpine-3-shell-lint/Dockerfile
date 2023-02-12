# Base image
FROM docker.io/library/bash-test/alpine-3-bash-test:latest

# Define environment
ARG CNT64_LINT_USER="linter"

# Copy image setup script
COPY helper-shell-lint/image-setup /image-setup

# Setup image
RUN \
    /image-setup && \
    rm /image-setup

# Setup image / shellcheck
RUN \
    ${CNT64_SYSADMIN_BIN}/toolbox64_install_shellcheck

# Run shellcheck against /src
USER ${CNT64_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
