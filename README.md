# Project: Container64

```shell linenums="0"
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

**Container64** is project for building and sharing OCI compliant container images for testing infrastructure management tools.

### Container collection: Ansible Node

- Purpose: Ansible node testing
- Packages: SystemD, Sudo, Python3

| Image                        | OS          | Base Image                          |
| ---------------------------- | ----------- | ----------------------------------- |
| `almalinux-8-ansible-node`   | almalinux   | `docker.io/library/almalinux:8`     |
| `centos-8-ansible-node`      | centos      | `docker.io/library/centos:8`        |
| `debian-10-ansible-node`     | debian      | `docker.io/library/debian:buster`   |
| `debian-11-ansible-node`     | debian      | `docker.io/library/debian:bullseye` |
| `fedora-33-ansible-node`     | fedora      | `docker.io/library/fedora:33`       |
| `fedora-35-ansible-node`     | fedora      | `docker.io/library/fedora:35`       |
| `oraclelinux-8-ansible-node` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `rockylinux-8-ansible-node`  | rhel        | `docker.io/rockylinux:8`            |
| `rhel-8-ansible-node`        | rhel        | `docker.io/redhat/ubi8:latest`      |
| `ubuntu-20.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ubuntu-21.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |

### Container collection: Bash Test

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                     | OS          | Base Image                          |
| ------------------------- | ----------- | ----------------------------------- |
| `almalinux-8-bash-test`   | almalinux   | `docker.io/library/almalinux:8`     |
| `alpine-3-bash-test`      | alpine      | `docker.io/library/alpine:3`        |
| `centos-7-bash-test`      | centos      | `quay.io/centos/centos:centos7`     |
| `centos-8-bash-test`      | centos      | `quay.io/centos/centos:8`           |
| `centos-9-bash-test`      | centos      | `quay.io/centos/centos:stream9`     |
| `debian-9-bash-test`      | debian      | `docker.io/library/debian:stretch`  |
| `debian-10-bash-test`     | debian      | `docker.io/library/debian:buster`   |
| `debian-11-bash-test`     | debian      | `docker.io/library/debian:bullseye` |
| `fedora-33-bash-test`     | fedora      | `docker.io/library/fedora:33`       |
| `fedora-34-bash-test`     | fedora      | `docker.io/library/fedora:34`       |
| `fedora-35-bash-test`     | fedora      | `docker.io/library/fedora:35`       |
| `oraclelinux-7-bash-test` | oraclelinux | `docker.io/library/oraclelinux:7`   |
| `oraclelinux-8-bash-test` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `rockylinux-8-bash-test`  | rockylinux  | `docker.io/rockylinux:8`            |
| `rhel-8-bash-test`        | rhel        | `docker.io/redhat/ubi8:latest`      |
| `ubuntu-20.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ubuntu-21.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |
| `ubuntu-22.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:22.04`    |

### Container collection: Terraform test

- Purpose: Terraform code testing
- Packages: TFSec, TFLint, Terraform

| Image                          | OS          | Base Image                        |
| ------------------------------ | ----------- | --------------------------------- |
| `oraclelinux-8-terraform-test` | oraclelinux | `docker.io/library/oraclelinux:8` |

### Container collection: Bash Linter

- Purpose: Unix Shell scripts linting
- Packages: ShellCheck, OS utilities

| Image                 | OS     | Base Image                   |
| --------------------- | ------ | ---------------------------- |
| `alpine-3-shell-lint` | alpine | `docker.io/library/alpine:3` |

## Usage

Run a command inside the container:

```shell
# Using docker:
docker run ghcr.io/serdigital64/<IMAGE> <COMMAND>
# Using podman:
podman run ghcr.io/serdigital64/<IMAGE> <COMMAND>
```

## Deployment

### Requirements

- Container engine
  - docker or podman
- Bash

### Installation

Download the target image to the local registry:

```shell
# Using docker:
docker pull ghcr.io/serdigital64/<IMAGE>
# Using podman:
podman pull ghcr.io/serdigital64/<IMAGE>`
```

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

- [Guidelines](CONTRIBUTING.md)
- [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)

## Author

- [SerDigital64](https://github.com/serdigital64)
