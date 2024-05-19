# Base image
FROM ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest

#
# Setup image
#

# Copy image setup script
COPY --chmod=700 helpers/terraform-test/setup /setup

# Set setup parameters
ARG CNT64_TERRAFORM_TEST_USER="test"

# Setup image
RUN \
    sudo -E /setup && \
    sudo rm /setup

# Run linter against /src
USER ${CNT64_TERRAFORM_TEST_USER}
