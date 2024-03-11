# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/X_BASE_IMAGE_X

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="cnt64"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Install applications
RUN \
    # X_PLACEHOLDER_INSTALL_APPS_X

# Set default user and entrypoint
USER ${CNT64_USER}
# X_PLACEHOLDER_ENTRYPOINT_APPS_X
