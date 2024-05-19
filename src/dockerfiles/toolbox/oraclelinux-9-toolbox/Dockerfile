# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/oraclelinux-9-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_USER="sysadmin"
ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/installer64"

#
# Setup image
#

# Copy image setup scripts
COPY --chmod=700 helpers/toolbox/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-gcc" && \
    "${CNT64_INSTALLER_ROOT}/install-nodejs" && \
    "${CNT64_INSTALLER_ROOT}/install-bat" && \
    "${CNT64_INSTALLER_ROOT}/install-duf" && \
    "${CNT64_INSTALLER_ROOT}/install-eza" && \
    "${CNT64_INSTALLER_ROOT}/install-fd" && \
    "${CNT64_INSTALLER_ROOT}/install-fzf" && \
    "${CNT64_INSTALLER_ROOT}/install-gomplate" && \
    "${CNT64_INSTALLER_ROOT}/install-gping" && \
    "${CNT64_INSTALLER_ROOT}/install-httpie" && \
    "${CNT64_INSTALLER_ROOT}/install-lnav" && \
    "${CNT64_INSTALLER_ROOT}/install-neovim" && \
    "${CNT64_INSTALLER_ROOT}/install-starship" && \
    "${CNT64_INSTALLER_ROOT}/install-yq" && \
    "${CNT64_INSTALLER_ROOT}/install-zoxide" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-bashit" && \
    sudo -E -H -u "${CNT64_USER}" "/home/${CNT64_USER}/.bash_it/install.sh" --silent --append-to-config

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/bash", "--login" ]
