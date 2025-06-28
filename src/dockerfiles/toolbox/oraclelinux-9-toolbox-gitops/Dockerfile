# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-k8s:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_ANSIBLE_PIPX="OFF"

RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-act" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-argocdcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-fluxcdcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-jenkinsxcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-ghcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-packer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraformer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terragrunt" && \
    ${CNT64_INSTALLER_ROOT}/install-ansible && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-mongodbcli && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-mysqlcli && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-psqlcli && \
    ${CNT64_INSTALLER_ROOT}/install-pgcli && \
    ${CNT64_INSTALLER_ROOT}/install-pgadmin
