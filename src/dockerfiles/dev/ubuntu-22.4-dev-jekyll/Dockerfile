# Base image
FROM ghcr.io/automation64/dev/ubuntu-22.4-dev:latest

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

# Set installer parameters
ARG INST64_RUBY_DEVELOPMENT="ON"

# Install applications
RUN \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-gcc" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-ruby" && \
    sudo -E "${CNT64_INSTALLER_ROOT}/install-nodejs" && \
    sudo ln -s "/usr/local/bin/ruby.env" "/home/${CNT64_USER}/.env.d/64_ruby.env" && \
    /bin/bash --login -c ". /usr/local/bin/ruby.env; ${CNT64_INSTALLER_ROOT}/install-jekyll"
