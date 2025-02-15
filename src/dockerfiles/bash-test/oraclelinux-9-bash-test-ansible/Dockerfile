# Base image
FROM ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"
ARG CNT64_USER="test"

#
# Setup image
#

# Set installer parameters
ARG INST64_ANSIBLE_PIPX="OFF"

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-ansible"
