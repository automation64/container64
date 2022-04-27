# Base image
FROM docker.io/library/oraclelinux:8

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8.0" \
    container64.image-version="0.1.0" \
    container64.image-content="tfsec" \
    org.opencontainers.image.description="Purpose: Terraform scripts testing - Packages: TFSec"

# Prepare package installer
ENV container="docker"

# Download BashLib64
COPY loader/bashlib64.bash /cmd

# Prepare environment
ARG BL64_LIB_CMD="1"
ARG CNT64_TEST_USER="test"
ARG CNT64_SRC_TFSCAN="https://github.com/aquasecurity/tfsec/releases/download/v1.19.0/tfsec-linux-amd64"
ARG CNT64_BIN_TFSCAN="/usr/local/bin/tfscan"
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_iam_user_add ${CNT64_TEST_USER} && \
    /cmd bl64_rxtx_web_get_file ${CNT64_SRC_TFSCAN} ${CNT64_BIN_TFSCAN} '0' '0755'

# Cleanup
RUN /cmd bl64_fs_cleanup_full && rm /cmd

USER ${CNT64_TEST_USER}
