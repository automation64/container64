# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-8-toolbox:latest

#
# Environment definition
#
# * See docs/base-environment.md for details
#

ENV CNT64_OPT_ROOT="/opt"
ENV CNT64_INSTALLER_ROOT="${CNT64_OPT_ROOT}/cnt64"

#
# Setup image
#

USER root
COPY installer/* ${CNT64_INSTALLER_ROOT}/
RUN \
    sudo -E ${CNT64_INSTALLER_ROOT}/install-gcloud

#    sudo -E ${CNT64_INSTALLER_ROOT}/install-aws_cli && \
