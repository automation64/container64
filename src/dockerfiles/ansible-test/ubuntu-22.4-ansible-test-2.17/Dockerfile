# Base image
FROM ghcr.io/automation64/base/ubuntu-22.4-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"
ARG CNT64_USER="test"

#
# Setup image
#

# Copy image setup script
COPY --chmod=700 helpers/ansible-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm -f /setup

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_PYTHON_DEVELOPMENT="YES"
ARG INST64_ANSIBLE_VERSION="2.17"

# Install applications
RUN \
    /opt/sysop64/mod/linux-repo/linux-repo-update-all && \
    "${CNT64_INST64_PATH}/install-bzip2" && \
    "${CNT64_INST64_PATH}/install-go" && \
    "${CNT64_INST64_PATH}/install-python" && \
    "${CNT64_INST64_PATH}/install-uv" && \
    "${CNT64_INST64_PATH}/install-xz" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-ansible" && \
    /opt/sysop64/mod/linux-repo/linux-repo-cleanup

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
USER ${CNT64_USER}
