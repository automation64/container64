FROM docker.io/library/ubuntu:21.04
LABEL \
    container64.os-name="ubuntu" \
    container64.os-version="21.4" \
    container64.image-version="0.1.0" \
    container64.image-content="systemd"
ENV container="docker"
ENV LC_ALL="C"
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get -y install \
    ca-certificates \
    dbus \
    dmsetup \
    networkd-dispatcher \
    openssl \
    python3 \
    python3.9 \
    readline-common \
    shared-mime-info \
    tzdata \
    xdg-user-dirs
RUN apt-get -y install \
    systemd \
    systemd-sysv \
    systemd-timesyncd
RUN apt-get clean
RUN systemctl set-default multi-user.target
CMD ["/lib/systemd/systemd"]
