# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set installer parameters
ARG INST64_ANSIBLE_PIPX="OFF"

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-packer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terragrunt"
