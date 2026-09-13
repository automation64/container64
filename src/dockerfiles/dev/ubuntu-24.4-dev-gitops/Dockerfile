# Base image
FROM ghcr.io/automation64/dev/ubuntu-24.4-dev-cloud:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_KREW_SYSTEM_WIDE="OFF"

# Install applications
RUN \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-update-all && \
    sudo -E "${CNT64_INST64_PATH}/install-eksctl" && \
    sudo -E "${CNT64_INST64_PATH}/install-helm-chart-releaser" && \
    sudo -E "${CNT64_INST64_PATH}/install-helm-chart-tester" && \
    sudo -E "${CNT64_INST64_PATH}/install-helm" && \
    sudo -E "${CNT64_INST64_PATH}/install-istioctl" && \
    sudo -E "${CNT64_INST64_PATH}/install-k9s" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubelinter" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubeconform" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubectl" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubescape" && \
    sudo -E "${CNT64_INST64_PATH}/install-yamllint" && \
    sudo -E "${CNT64_INST64_PATH}/install-trivy" && \
    sudo -E "${CNT64_INST64_PATH}/install-argocdcli" && \
    sudo -E "${CNT64_INST64_PATH}/install-fluxcdcli" && \
    sudo -E "${CNT64_INST64_PATH}/install-jenkinsxcli" && \
    sudo -E "${CNT64_INST64_PATH}/install-terraform" && \
    sudo -E "${CNT64_INST64_PATH}/install-terraform-docs" && \
    sudo -E "${CNT64_INST64_PATH}/install-terraformer" && \
    sudo -E "${CNT64_INST64_PATH}/install-terragrunt" && \
    sudo -E "${CNT64_INST64_PATH}/install-packer" && \
    sudo -E "${CNT64_INST64_PATH}/install-tflint" && \
    sudo -E "${CNT64_INST64_PATH}/install-tfsec" && \
    "${CNT64_INST64_PATH}/install-krew" && \
    "${CNT64_INST64_PATH}/install-ansible" && \
    "${CNT64_INST64_PATH}/install-ansiblelint" && \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-cleanup
