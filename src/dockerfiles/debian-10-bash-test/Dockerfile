# Base image
FROM docker.io/library/debian:buster

# Image Metadata
LABEL \
    container64.os-name="debian" \
    container64.os-version="10.0" \
    container64.image-version="0.1.0" \
    container64.image-content="bash,bats-core"

# Prepare package installer
ENV container="docker"

#ADD https://raw.githubusercontent.com/serdigital64/bashlib64/main/bashlib64.bash /64
COPY cmd /

RUN /cmd bl64_msg_show_info 'hello_world'

# Final command
CMD ["/lib/systemd/systemd"]
