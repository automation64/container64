# Base image
FROM docker.io/library/oraclelinux:8

# Image Metadata
LABEL \
    container64.os-name="oraclelinux" \
    container64.os-version="8" \
    container64.image-version="0.2.0" \
    container64.image-content="terraform,tfsec,tflint" \
    org.opencontainers.image.description="Purpose: Terraform scripts testing - Packages: TFSec, TFLint, Terraform"

# Prepare package installer
ENV container="docker"

# Provision setup script
COPY dockerfiles/oraclelinux-8-terraform-test/image-setup /image-setup
COPY loader/bashlib64.bash /bashlib64.bash

# Prepare environment
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
    chmod 700 /image-setup && \
    /image-setup && \
    rm /image-setup

USER ${CNT64_TEST_USER}
