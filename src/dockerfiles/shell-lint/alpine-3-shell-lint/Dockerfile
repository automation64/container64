# Base image
FROM ghcr.io/automation64/bash-test/alpine-3-bash-test:latest

#
# Environment definition
#

ENV CNT64_SHELL_INT_USER="linter"

#
# Setup image
#

# Copy image setup script
COPY helper-shell-lint/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-shellcheck

# Run linter against /src
USER ${CNT64_SHELL_INT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
