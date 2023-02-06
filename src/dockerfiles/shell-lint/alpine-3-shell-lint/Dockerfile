# Base image
FROM docker.io/library/alpine:3

# Prepare package installer
ENV container="docker"

# Define environment
ARG CNT64_LINT_USER="linter"
ARG CNT64_LINT_VOLUME="/src"

# Copy image setup script
COPY helper-shell-lint/image-setup /image-setup
COPY loader/bashlib64.bash /bashlib64.bash

# Setup image
RUN \
    apk add bash && \
    /image-setup && \
    rm /image-setup /bashlib64.bash

# Run shellcheck against /src
USER ${CNT64_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
