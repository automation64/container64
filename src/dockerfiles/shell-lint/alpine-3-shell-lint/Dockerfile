# Base image
FROM ghcr.io/automation64/bash-test/alpine-3-bash-test:latest

#
# Setup image
#

# Copy image setup script
COPY helpers/shell-lint/setup /setup

# Set setup parameters
ENV CNT64_SHELL_LINT_USER="linter"

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-shellcheck

# Run linter against /src
USER ${CNT64_SHELL_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
