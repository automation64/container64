# Base image
FROM docker.io/library/oraclelinux:8

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8.0" \
    container64.image-version="0.1.0" \
    container64.image-content="tfsec" \
    org.opencontainers.image.description="Purpose: Terraform scripts testing - Packages: TFSec, TFLint, Terraform"

# Prepare package installer
ENV container="docker"

# Download BashLib64
COPY loader/bashlib64.bash /cmd

# Prepare environment
ARG BL64_LIB_CMD="1"
ARG BL64_LIB_VERBOSE="2"
ARG CNT64_HELPERS="unzip"
ARG CNT64_TEST_USER="test"
ARG CNT64_SRC_TFSEC="https://github.com/aquasecurity/tfsec/releases/download/v1.19.0/tfsec-linux-amd64"
ARG CNT64_BIN_TFSEC="/usr/local/bin/tfsec"
ARG CNT64_LOCAL_BIN="/usr/local/bin"
ARG CNT64_SRC_TERRAFORM="https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip"
ARG CNT64_BIN_TERRAFORM="/usr/local/bin/terraform"
ARG CNT64_SRC_TFLINT="https://github.com/terraform-linters/tflint/releases/download/v0.36.2/tflint_linux_amd64.zip"
ARG CNT64_BIN_TFLINT="/usr/local/bin/tflint"
RUN \
    /bin/chmod 755 /cmd && \
    /cmd bl64_iam_user_add ${CNT64_TEST_USER} && \
    /cmd bl64_pkg_deploy ${CNT64_HELPERS} && \
    /cmd bl64_rxtx_web_get_file ${CNT64_SRC_TFSEC} ${CNT64_BIN_TFSEC} '0' '0755' && \
    /cmd bl64_rxtx_web_get_file ${CNT64_SRC_TERRAFORM} ${CNT64_BIN_TERRAFORM}.zip && \
    /cmd bl64_arc_open_zip ${CNT64_BIN_TERRAFORM}.zip ${CNT64_LOCAL_BIN} && \
    /cmd bl64_rxtx_web_get_file ${CNT64_SRC_TFLINT} ${CNT64_BIN_TFLINT}.zip && \
    /cmd bl64_arc_open_zip ${CNT64_BIN_TFLINT}.zip ${CNT64_LOCAL_BIN}

# Cleanup
RUN /cmd bl64_fs_cleanup_full && rm /cmd

USER ${CNT64_TEST_USER}
