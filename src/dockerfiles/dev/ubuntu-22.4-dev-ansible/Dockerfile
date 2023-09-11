# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="dev"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Set installer parameters
ENV INST64_PYTHON_FLAG_DEVELOPMENT="1"
ENV INST64_ANSIBLE_USER="${CNT64_USER}"
ENV INST64_ANSIBLE_HOME="/home/${CNT64_USER}"

# Install applications
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-python && \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-yamllint && \
    sudo -E -H -u ${INST64_ANSIBLE_USER} ${CNT64_INSTALLER_ROOT}/install-ansible
