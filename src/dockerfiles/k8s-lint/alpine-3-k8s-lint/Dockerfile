# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/alpine-3-base:latest

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

# Install applications
RUN \
    sudo -E "${CNT64_INST64_PATH}/install-helm" && \
    sudo -E "${CNT64_INST64_PATH}/install-helm-chart-tester" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubelinter" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubescape" && \
    sudo -E "${CNT64_INST64_PATH}/install-kubectl"

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash", "--login", "-c" ]
