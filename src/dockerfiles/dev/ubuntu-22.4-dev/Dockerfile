# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/ubuntu-22.4-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Bootstrap image
#

# Copy image setup scripts
COPY --chmod=700 helpers/dev/setup /setup

#
# Setup image
#

# Setup image
RUN \
    /setup && \
    rm /setup

# Set installer parameters
ARG INST64_SHELLCHECK_METHOD="BINARY"
ARG INST64_PYTHON_FLAG_DEVELOPMENT="ON"
ARG INST64_ZOXIDE_VERSION="v0.9.4" # TODO: Remove once package latest release is available

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-python" && \
    "${CNT64_INSTALLER_ROOT}/install-gcc" && \
    "${CNT64_INSTALLER_ROOT}/install-nodejs" && \
    "${CNT64_INSTALLER_ROOT}/install-act" && \
    "${CNT64_INSTALLER_ROOT}/install-bat" && \
    "${CNT64_INSTALLER_ROOT}/install-delta" && \
    "${CNT64_INSTALLER_ROOT}/install-duf" && \
    "${CNT64_INSTALLER_ROOT}/install-eza" && \
    "${CNT64_INSTALLER_ROOT}/install-lsd" && \
    "${CNT64_INSTALLER_ROOT}/install-fd" && \
    "${CNT64_INSTALLER_ROOT}/install-fzf" && \
    "${CNT64_INSTALLER_ROOT}/install-ghcli" && \
    "${CNT64_INSTALLER_ROOT}/install-gitleaks" && \
    "${CNT64_INSTALLER_ROOT}/install-gitui" && \
    "${CNT64_INSTALLER_ROOT}/install-gomplate" && \
    "${CNT64_INSTALLER_ROOT}/install-hwatch" && \
    "${CNT64_INSTALLER_ROOT}/install-lnav" && \
    "${CNT64_INSTALLER_ROOT}/install-neovim" && \
    "${CNT64_INSTALLER_ROOT}/install-shellcheck" && \
    "${CNT64_INSTALLER_ROOT}/install-shfmt" && \
    "${CNT64_INSTALLER_ROOT}/install-starship" && \
    "${CNT64_INSTALLER_ROOT}/install-syft" && \
    "${CNT64_INSTALLER_ROOT}/install-taskfile" && \
    "${CNT64_INSTALLER_ROOT}/install-trufflehog" && \
    "${CNT64_INSTALLER_ROOT}/install-yq" && \
    "${CNT64_INSTALLER_ROOT}/install-zoxide" && \
    "${CNT64_INSTALLER_ROOT}/install-zellij" && \
    "${CNT64_INSTALLER_ROOT}/install-devbin64" && \
    "${CNT64_INSTALLER_ROOT}/install-sysden64" && \
    "${CNT64_INSTALLER_ROOT}/install-sysop64" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-pipx" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/install-precommit" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_INSTALLER_ROOT}/sysden64/bin/sysden64" -l

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/zsh", "--login" ]
