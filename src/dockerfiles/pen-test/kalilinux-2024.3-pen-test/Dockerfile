# Template: 1.0.0
# Base image
FROM ghcr.io/automation64/base/kalilinux-2024.3-base:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ARG CNT64_USER="cnt64"
ARG CNT64_OPT_ROOT="/opt"
ARG CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/inst64"

#
# Setup image
#

# Copy image setup scripts
COPY --chmod=700 helpers/pen-test/setup /setup

# Setup image
RUN \
    /setup && \
    rm /setup

# Set installer parameters

# Install applications
RUN \
    "${CNT64_INSTALLER_ROOT}/install-bat" && \
    "${CNT64_INSTALLER_ROOT}/install-capa" && \
    "${CNT64_INSTALLER_ROOT}/install-eza" && \
    "${CNT64_INSTALLER_ROOT}/install-lsd" && \
    "${CNT64_INSTALLER_ROOT}/install-fd" && \
    "${CNT64_INSTALLER_ROOT}/install-gcc" && \
    "${CNT64_INSTALLER_ROOT}/install-go" && \
    "${CNT64_INSTALLER_ROOT}/install-gomplate" && \
    "${CNT64_INSTALLER_ROOT}/install-lynis" && \
    "${CNT64_INSTALLER_ROOT}/install-neovim" && \
    "${CNT64_INSTALLER_ROOT}/install-sqlmap" && \
    "${CNT64_INSTALLER_ROOT}/install-trufflehog" && \
    "${CNT64_INSTALLER_ROOT}/install-yq" && \
    "${CNT64_INSTALLER_ROOT}/install-zellij" && \
    "${CNT64_INSTALLER_ROOT}/install-zoxide" && \
    "${CNT64_INSTALLER_ROOT}/install-fzf" && \
    "${CNT64_INSTALLER_ROOT}/install-gitleaks" && \
    "${CNT64_INSTALLER_ROOT}/install-hwatch" && \
    "${CNT64_INSTALLER_ROOT}/install-lnav" && \
    "${CNT64_INSTALLER_ROOT}/install-devbin64" && \
    "${CNT64_INSTALLER_ROOT}/install-sysden64" && \
    "${CNT64_INSTALLER_ROOT}/install-testssl" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_OPT_ROOT}/sysden64/bin/sysden64" -l

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/zsh", "--login" ]
