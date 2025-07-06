# Base image
FROM ghcr.io/automation64/dev/ubuntu-24.4-dev-cloud:latest

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

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_KREW_SYSTEM_WIDE="OFF"

# Install applications
RUN \
    sudo /opt/sysop64/linux-repo/linux-repo-refresh && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-eksctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-releaser" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm-chart-tester" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-helm" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-istioctl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-k9s" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubelinter" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubeconform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubectl" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-kubescape" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-yamllint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-trivy" && \
    "${CNT64_INSTALLER_ROOT}/install-krew" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-argocdcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-fluxcdcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-jenkinsxcli" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraform" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraform-docs" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terraformer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-terragrunt" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-packer" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-tflint" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-tfsec" && \
    "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    "${CNT64_INSTALLER_ROOT}/install-ansiblelint" && \
    sudo /opt/sysop64/linux-repo/linux-repo-cleanup
