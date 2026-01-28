# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/oraclelinux-9-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="sysadmin"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Copy image setup scripts
COPY --chmod=700 helpers/toolbox/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Set installer parameters
ARG INST64_REFRESH_PACKAGE_MANAGER="OFF"

# Install applications
RUN \
    sudo /opt/sysop64/linux-repo/linux-repo-refresh && \
    "${CNT64_INSTALLER_ROOT}/install-7zip" && \
    "${CNT64_INSTALLER_ROOT}/install-zip" && \
    "${CNT64_INSTALLER_ROOT}/install-atuin" && \
    "${CNT64_INSTALLER_ROOT}/install-bat" && \
    "${CNT64_INSTALLER_ROOT}/install-btop" && \
    "${CNT64_INSTALLER_ROOT}/install-csh" && \
    "${CNT64_INSTALLER_ROOT}/install-delta" && \
    "${CNT64_INSTALLER_ROOT}/install-devbin64" && \
    "${CNT64_INSTALLER_ROOT}/install-duf" && \
    "${CNT64_INSTALLER_ROOT}/install-eza" && \
    "${CNT64_INSTALLER_ROOT}/install-fd" && \
    "${CNT64_INSTALLER_ROOT}/install-fish" && \
    "${CNT64_INSTALLER_ROOT}/install-fzf" && \
    "${CNT64_INSTALLER_ROOT}/install-go" && \
    "${CNT64_INSTALLER_ROOT}/install-gomplate" && \
    "${CNT64_INSTALLER_ROOT}/install-helix" && \
    "${CNT64_INSTALLER_ROOT}/install-hwatch" && \
    "${CNT64_INSTALLER_ROOT}/install-iotop" && \
    "${CNT64_INSTALLER_ROOT}/install-iptrafng" && \
    "${CNT64_INSTALLER_ROOT}/install-lib-atomic" && \
    "${CNT64_INSTALLER_ROOT}/install-lnav" && \
    "${CNT64_INSTALLER_ROOT}/install-lsd" && \
    "${CNT64_INSTALLER_ROOT}/install-ltrace" && \
    "${CNT64_INSTALLER_ROOT}/install-mc" && \
    "${CNT64_INSTALLER_ROOT}/install-neovim" && \
    "${CNT64_INSTALLER_ROOT}/install-nmap" && \
    "${CNT64_INSTALLER_ROOT}/install-nodejs" && \
    "${CNT64_INSTALLER_ROOT}/install-uv" && \
    "${CNT64_INSTALLER_ROOT}/install-python" && \
    "${CNT64_INSTALLER_ROOT}/install-rclone" && \
    "${CNT64_INSTALLER_ROOT}/install-ripgrep" && \
    "${CNT64_INSTALLER_ROOT}/install-rsync" && \
    "${CNT64_INSTALLER_ROOT}/install-starship" && \
    "${CNT64_INSTALLER_ROOT}/install-strace" && \
    "${CNT64_INSTALLER_ROOT}/install-superfile" && \
    "${CNT64_INSTALLER_ROOT}/install-sysden64" && \
    "${CNT64_INSTALLER_ROOT}/install-sysstat" && \
    "${CNT64_INSTALLER_ROOT}/install-telnet" && \
    "${CNT64_INSTALLER_ROOT}/install-tmux" && \
    "${CNT64_INSTALLER_ROOT}/install-yq" && \
    "${CNT64_INSTALLER_ROOT}/install-zellij" && \
    "${CNT64_INSTALLER_ROOT}/install-zoxide" && \
    "${CNT64_INSTALLER_ROOT}/install-zsh" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-zsh-ohmyzsh" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-zsh-powerlevel10k" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-zsh-autosuggestions" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-zsh-fzf-tab" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-zsh-syntax-highlighting" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_OPT_ROOT}/sysden64/bin/sysden64" -l && \
    sudo /opt/sysop64/linux-repo/linux-repo-cleanup

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/zsh", "--login" ]
