# Project: Container64

```text
   █████████                       █████               ███                                 ████████  █████ █████
  ███░░░░░███                     ░░███               ░░░                                 ███░░░░███░░███ ░░███
 ███     ░░░   ██████  ████████   ███████    ██████   ████  ████████    ██████  ████████ ░███   ░░░  ░███  ░███ █
░███          ███░░███░░███░░███ ░░░███░    ░░░░░███ ░░███ ░░███░░███  ███░░███░░███░░███░█████████  ░███████████
░███         ░███ ░███ ░███ ░███   ░███      ███████  ░███  ░███ ░███ ░███████  ░███ ░░░ ░███░░░░███ ░░░░░░░███░█
░░███     ███░███ ░███ ░███ ░███   ░███ ███ ███░░███  ░███  ░███ ░███ ░███░░░   ░███     ░███   ░███       ░███░
 ░░█████████ ░░██████  ████ █████  ░░█████ ░░████████ █████ ████ █████░░██████  █████    ░░████████        █████
  ░░░░░░░░░   ░░░░░░  ░░░░ ░░░░░    ░░░░░   ░░░░░░░░ ░░░░░ ░░░░ ░░░░░  ░░░░░░  ░░░░░      ░░░░░░░░        ░░░░░
```

## Overview

Collection of OCI compliant container creation files.

| Image:Tag                          | OS          | Base Image                          | Packages               | Purpose              | Source File                                                                        |
| ---------------------------------- | ----------- | ----------------------------------- | ---------------------- | -------------------- | ---------------------------------------------------------------------------------- |
| `ubuntu-20.4-ansible-node:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:20.04`    | SystemD, Sudo, Python3 | Ansible node testing | [ubuntu-20.4-ansible-node](src/dockerfile/ubuntu-20.4-ansible-node/Dockerfile)     |
| `ubuntu-21.4-ansible-node:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:21.04`    | SystemD, Sudo, Python3 | Ansible node testing | [ubuntu-21.4-ansible-node](src/dockerfile/ubuntu-21.4-ansible-node/Dockerfile)     |
| `debian-10-ansible-node:0.1.0`     | debian      | `docker.io/library/debian:buster`   | SystemD, Sudo, Python3 | Ansible node testing | [debian-10-ansible-node](src/dockerfile/debian-10-ansible-node/Dockerfile)         |
| `debian-11-ansible-node:0.1.0`     | debian      | `docker.io/library/debian:bullseye` | SystemD, Sudo, Python3 | Ansible node testing | [debian-11-ansible-node](src/dockerfile/debian-11-ansible-node/Dockerfile)         |
| `oraclelinux-8-ansible-node:0.1.0` | oraclelinux | `docker.io/library/oraclelinux:8`   | SystemD, Sudo, Python3 | Ansible node testing | [oraclelinux-8-ansible-node](src/dockerfile/oraclelinux-8-ansible-node/Dockerfile) |
| `fedora-33-ansible-node:0.1.0`     | fedora      | `docker.io/library/fedora:33`       | SystemD, Sudo, Python3 | Ansible node testing | [fedora-33-ansible-node](src/dockerfile/fedora-33-ansible-node/Dockerfile)         |
| `centos-8-ansible-node:0.1.0`      | centos      | `docker.io/library/centos:8`        | SystemD, Sudo, Python3 | Ansible node testing | [centos-8-ansible-node](src/dockerfile/centos-8-ansible-node/Dockerfile)           |

## Deployment

### Podman

`podman pull ghcr.io/serdigital64/<IMAGE>`

## Usage

### Podman

`podman run ghcr.io/serdigital64/<IMAGE> <COMMAND>`

## Source Code

Each image has a dedicated directory for storing the source file (Dockerfile) and additional artifacts.
Image directories are grouped based on the file format:

- `src/dockerfile/`

Images can be generated using the build script:

- `bin/devcnt64-build`

### Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)

### Author

- [SerDigital64](https://github.com/serdigital64)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
