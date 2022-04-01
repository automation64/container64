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

**Container64** is project for building and sharing OCI compliant container images that can be used for testing infrastructure management tools.

### Container collection: Ansible Node

- Purpose: Ansible node testing
- Packages: SystemD, Sudo, Python3

| Image                        | OS          | Base Image                          |
| ---------------------------- | ----------- | ----------------------------------- |
| `almalinux-8-ansible-node`   | almalinux   | `docker.io/library/almalinux:8.5`   |
| `centos-8-ansible-node`      | centos      | `docker.io/library/centos:8`        |
| `debian-10-ansible-node`     | debian      | `docker.io/library/debian:buster`   |
| `debian-11-ansible-node`     | debian      | `docker.io/library/debian:bullseye` |
| `fedora-33-ansible-node`     | fedora      | `docker.io/library/fedora:33`       |
| `fedora-35-ansible-node`     | fedora      | `docker.io/library/fedora:35`       |
| `oraclelinux-8-ansible-node` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `rhel-8-ansible-node`        | rhel        | `docker.io/redhat/ubi8:8.5`         |
| `ubuntu-20.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ubuntu-21.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |

### Container collection: Bash Test

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                     | OS          | Base Image                          |
| ------------------------- | ----------- | ----------------------------------- |
| `almalinux-8-bash-test`   | almalinux   | `docker.io/library/almalinux:8.5`   |
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
| `rhel-8-bash-test`        | rhel        | `docker.io/redhat/ubi8:8.5`         |
| `ubuntu-20.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ubuntu-21.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |

## Usage

Run a command inside the container:

```shell
# Using docker:
docker run ghcr.io/serdigital64/<IMAGE> <COMMAND>
# Using podman:
podman run ghcr.io/serdigital64/<IMAGE> <COMMAND>
```

## Deployment

Download the image to the local registry:

```shell
# Using docker:
docker pull ghcr.io/serdigital64/<IMAGE>
# Using podman:
podman pull ghcr.io/serdigital64/<IMAGE>`
```

## Development

### Environment

- Prepare dev tools
  - Install GIT
  - Install Docker or Podman
- Clone GIT repository

  ```shell
  git clone https://github.com/serdigital64/container64.git
  ```

- Adjust environment variables to reflect your configuration:

  ```shell
  # Copy environment definition files from templates:
  cp dot.local .local
  cp dot.secrets .secrets
  # Review and update content for both files
  ```

- Initialize dev environment variables

  ```shell
  source bin/devcnt-set
  ```

### Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)
- Project Documentation: [https://serdigital64.github.io/container64/](https://serdigital64.github.io/container64/)

### Contributing

Help on implementing new features and maintaining the code base is welcomed.

[Contributor Covenant Code of Conduct](https://serdigital64.github.io/container64/cod/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)

### Author

- [SerDigital64](https://github.com/serdigital64)
