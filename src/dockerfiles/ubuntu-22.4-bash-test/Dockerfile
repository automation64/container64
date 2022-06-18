#
# Base Image
#

FROM docker.io/library/ubuntu:22.04 AS base

# Image Metadata
LABEL \
    container64.os-name="ubuntu" \
    container64.os-version="22.4" \
    container64.image-version="0.2.0" \
    container64.image-content="bash,bats-core" \
    org.opencontainers.image.description="Purpose: Bash scripts testing - Packages: Bash, Bats Core, Bash Core plugins, OS utilities"

# Prepare package installer
ENV container="docker"

# Download BashLib64
COPY loader/bashlib64.bash /cmd

# Prepare environment
ARG BL64_LIB_CMD="1"
ARG BL64_LIB_VERBOSE="2"
ARG BL64_LIB_UMASK="u=rwx,g=rx,o=rx"
ARG CNT64_TEST_USER="test"
ARG CNT64_BATSCORE_VOLUME="/test"
ARG CNT64_HELPERS="sudo git wget curl gawk python3 python3-pip python3-venv unzip"
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_pkg_deploy ${CNT64_HELPERS} && \
    /cmd bl64_iam_user_add ${CNT64_TEST_USER} && \
    /cmd bl64_rbac_add_root ${CNT64_TEST_USER} && \
    /cmd bl64_fs_mkdir_full ${CNT64_BATSCORE_VOLUME} && \
    /cmd bl64_fs_cleanup_full

#
# Install BatsCore
#

FROM base AS batscore

ARG BL64_LIB_CMD="1"
ARG BL64_LIB_VERBOSE="2"
ARG BL64_LIB_UMASK="u=rwx,g=rx,o=rx"

# Install Bats-Core
ARG CNT64_BATSCORE_REPO="https://github.com/bats-core"
ARG CNT64_BATSCORE_NAME="bats-core"
ARG CNT64_BATSCORE_PATH="/opt/${CNT64_BATSCORE_NAME}"
ARG CNT64_BATSCORE_HELPERS="${CNT64_BATSCORE_PATH}/test_helper"

RUN \
    /cmd bl64_rxtx_git_get_dir "${CNT64_BATSCORE_REPO}/${CNT64_BATSCORE_NAME}" . "${CNT64_BATSCORE_PATH}" '0' 'master' && \
    /cmd bl64_fs_mkdir_full ${CNT64_BATSCORE_HELPERS} && \
    /cmd bl64_rxtx_git_get_dir "${CNT64_BATSCORE_REPO}/bats-support" . "${CNT64_BATSCORE_HELPERS}/bats-support" '0' 'master' && \
    /cmd bl64_rxtx_git_get_dir "${CNT64_BATSCORE_REPO}/bats-assert" . "${CNT64_BATSCORE_HELPERS}/bats-assert" '0' 'master' && \
    /cmd bl64_rxtx_git_get_dir "${CNT64_BATSCORE_REPO}/bats-file" . "${CNT64_BATSCORE_HELPERS}/bats-file" '0' 'master'

#
# Build final image
#

FROM base AS final

ARG CNT64_TEST_USER="test"

COPY --from=batscore /opt/bats-core /opt/bats-core/

CMD [ "/test" ]
USER ${CNT64_TEST_USER}
ENTRYPOINT [ "/opt/bats-core/bin/bats" ]
