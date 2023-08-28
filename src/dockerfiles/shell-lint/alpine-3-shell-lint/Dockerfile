# Base image
FROM ghcr.io/automation64/bash-test/alpine-3-bash-test:latest

#
# Setup image
#

# Set setup parameters
ENV CNT64_SHELL_INT_USER="linter"

# Copy image setup script
COPY helper-shell-lint/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Update installers
COPY installer/* ${CNT64_INSTALLER_ROOT}/

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-shellcheck

# Run linter against /src
USER ${CNT64_SHELL_INT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
