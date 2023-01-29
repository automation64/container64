# Base image
FROM docker.io/library/alpine:3

# Image Metadata
LABEL \
    container64.os-name="alpine" \
    container64.os-version="3" \
    container64.image-version="0.1.0" \
    container64.image-content="shellcheck" \
    org.opencontainers.image.description="Purpose: Unix Shell scripts linting - Packages: ShellCheck, OS utilities"

# Prepare build environment
ENV container="docker"
RUN apk add bash
COPY loader/bashlib64.bash /cmd

# Build image
ARG BL64_LIB_CMD="1"
ARG CNT64_LINT_USER="linter"
ARG CNT64_LINT_VOLUME="/src"
ARG CNT64_PACKAGES="shellcheck"
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_iam_user_add ${CNT64_LINT_USER} && \
    /cmd bl64_fs_mkdir_full ${CNT64_LINT_VOLUME} && \
    /cmd bl64_pkg_deploy ${CNT64_PACKAGES}

# Cleanup
RUN /cmd bl64_fs_cleanup_full && rm /cmd

# Run shellcheck against /src
USER ${CNT64_LINT_USER}
ENTRYPOINT [ "/usr/bin/shellcheck" ]
