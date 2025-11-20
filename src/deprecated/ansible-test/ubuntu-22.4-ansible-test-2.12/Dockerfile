# Base image
FROM ghcr.io/automation64/base/ubuntu-22.4-base:latest

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

# Copy image setup script
COPY --chmod=700 helpers/ansible-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm -f /setup

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"
ARG INST64_ANSIBLE_VERSION="2.12"

# Install applications
RUN \
    /opt/sysop64/linux-repo/linux-repo-refresh && \
    "${CNT64_INSTALLER_ROOT}/install-go" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-pipx" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-ansible" && \
    /opt/sysop64/linux-repo/linux-repo-cleanup

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
USER ${CNT64_USER}
