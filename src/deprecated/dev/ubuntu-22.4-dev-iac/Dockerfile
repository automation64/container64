# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terragrunt" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-packer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-tflint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-tfsec" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    "${CNT64_INSTALLER_ROOT}/install-ansiblelint"
