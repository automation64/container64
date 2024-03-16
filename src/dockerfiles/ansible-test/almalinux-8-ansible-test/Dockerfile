# Base image
FROM ghcr.io/automation64/base/almalinux-8-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"
ENV CNT64_USER="test"

#
# Setup image
#

# Copy image setup script
COPY --chmod=700 helpers/ansible-test/setup /setup

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Run systemd to allow services
CMD ["/lib/systemd/systemd"]
USER ${CNT64_USER}
