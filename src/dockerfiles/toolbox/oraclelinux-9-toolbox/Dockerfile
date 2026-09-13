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
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

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
# * zip and xz must be the first packages
RUN \
sudo /opt/sysop64/mod/linux-repo/linux-repo-update-all && \
    "${CNT64_INST64_PATH}/install-zip" && \
    "${CNT64_INST64_PATH}/install-xz" && \
    "${CNT64_INST64_PATH}/install-7zip" && \
    "${CNT64_INST64_PATH}/install-bash-preexec" && \
    "${CNT64_INST64_PATH}/install-bat" && \
    "${CNT64_INST64_PATH}/install-btop" && \
    "${CNT64_INST64_PATH}/install-bzip2" && \
    "${CNT64_INST64_PATH}/install-csh" && \
    "${CNT64_INST64_PATH}/install-delta" && \
    "${CNT64_INST64_PATH}/install-devbin64" && \
    "${CNT64_INST64_PATH}/install-duf" && \
    "${CNT64_INST64_PATH}/install-eza" && \
    "${CNT64_INST64_PATH}/install-fd" && \
    "${CNT64_INST64_PATH}/install-fish" && \
    "${CNT64_INST64_PATH}/install-fzf" && \
    "${CNT64_INST64_PATH}/install-git" && \
    "${CNT64_INST64_PATH}/install-go" && \
    "${CNT64_INST64_PATH}/install-gomplate" && \
    "${CNT64_INST64_PATH}/install-helix" && \
    "${CNT64_INST64_PATH}/install-iotop" && \
    "${CNT64_INST64_PATH}/install-iptrafng" && \
    "${CNT64_INST64_PATH}/install-lib-atomic" && \
    "${CNT64_INST64_PATH}/install-lnav" && \
    "${CNT64_INST64_PATH}/install-lsd" && \
    "${CNT64_INST64_PATH}/install-ltrace" && \
    "${CNT64_INST64_PATH}/install-mc" && \
    "${CNT64_INST64_PATH}/install-neovim" && \
    "${CNT64_INST64_PATH}/install-nmap" && \
    "${CNT64_INST64_PATH}/install-nodejs" && \
    "${CNT64_INST64_PATH}/install-python" && \
    "${CNT64_INST64_PATH}/install-rclone" && \
    "${CNT64_INST64_PATH}/install-ripgrep" && \
    "${CNT64_INST64_PATH}/install-ripgrep" && \
    "${CNT64_INST64_PATH}/install-rsync" && \
    "${CNT64_INST64_PATH}/install-starship" && \
    "${CNT64_INST64_PATH}/install-strace" && \
    "${CNT64_INST64_PATH}/install-stressng" && \
    "${CNT64_INST64_PATH}/install-superfile" && \
    "${CNT64_INST64_PATH}/install-sysden64" && \
    "${CNT64_INST64_PATH}/install-sysstat" && \
    "${CNT64_INST64_PATH}/install-telnet" && \
    "${CNT64_INST64_PATH}/install-tmux" && \
    "${CNT64_INST64_PATH}/install-uv" && \
    "${CNT64_INST64_PATH}/install-yq" && \
    "${CNT64_INST64_PATH}/install-zellij" && \
    "${CNT64_INST64_PATH}/install-zoxide" && \
    "${CNT64_INST64_PATH}/install-zsh" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-zsh-ohmyzsh" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-zsh-powerlevel10k" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-zsh-autosuggestions" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-zsh-fzf-tab" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INST64_PATH}/install-zsh-syntax-highlighting" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_OPT_ROOT}/sysden64/bin/sysden64" -l && \
    sudo /opt/sysop64/mod/linux-repo/linux-repo-cleanup

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/zsh", "--login" ]
