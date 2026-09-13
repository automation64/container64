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
ARG CNT64_INST64_PATH="${CNT64_OPT_ROOT}/inst64"

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
    "${CNT64_INST64_PATH}/install-bat" && \
    "${CNT64_INST64_PATH}/install-capa" && \
    "${CNT64_INST64_PATH}/install-eza" && \
    "${CNT64_INST64_PATH}/install-lsd" && \
    "${CNT64_INST64_PATH}/install-fd" && \
    "${CNT64_INST64_PATH}/install-gcc" && \
    "${CNT64_INST64_PATH}/install-go" && \
    "${CNT64_INST64_PATH}/install-gomplate" && \
    "${CNT64_INST64_PATH}/install-lynis" && \
    "${CNT64_INST64_PATH}/install-neovim" && \
    "${CNT64_INST64_PATH}/install-sqlmap" && \
    "${CNT64_INST64_PATH}/install-trufflehog" && \
    "${CNT64_INST64_PATH}/install-yq" && \
    "${CNT64_INST64_PATH}/install-zellij" && \
    "${CNT64_INST64_PATH}/install-zoxide" && \
    "${CNT64_INST64_PATH}/install-fzf" && \
    "${CNT64_INST64_PATH}/install-gitleaks" && \
    "${CNT64_INST64_PATH}/install-hwatch" && \
    "${CNT64_INST64_PATH}/install-lnav" && \
    "${CNT64_INST64_PATH}/install-devbin64" && \
    "${CNT64_INST64_PATH}/install-sysden64" && \
    "${CNT64_INST64_PATH}/install-testssl" && \
    sudo -E -H -u "${CNT64_USER}" "${CNT64_OPT_ROOT}/sysden64/bin/sysden64" -l

# Set default user and entrypoint
USER ${CNT64_USER}
ENTRYPOINT [ "/bin/zsh", "--login" ]
