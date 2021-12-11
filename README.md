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

### Container collection: Ansible Node

- Purpose: Ansible node testing
- Packages: SystemD, Sudo, Python3

| Image:Tag                          | OS          | Base Image                          | Source File                                                                        |
| ---------------------------------- | ----------- | ----------------------------------- | ---------------------------------------------------------------------------------- |
| `ubuntu-20.4-ansible-node:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:20.04`    | [ubuntu-20.4-ansible-node](src/dockerfile/ubuntu-20.4-ansible-node/Dockerfile)     |
| `ubuntu-21.4-ansible-node:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:21.04`    | [ubuntu-21.4-ansible-node](src/dockerfile/ubuntu-21.4-ansible-node/Dockerfile)     |
| `debian-10-ansible-node:0.1.0`     | debian      | `docker.io/library/debian:buster`   | [debian-10-ansible-node](src/dockerfile/debian-10-ansible-node/Dockerfile)         |
| `debian-11-ansible-node:0.1.0`     | debian      | `docker.io/library/debian:bullseye` | [debian-11-ansible-node](src/dockerfile/debian-11-ansible-node/Dockerfile)         |
| `oraclelinux-8-ansible-node:0.1.0` | oraclelinux | `docker.io/library/oraclelinux:8`   | [oraclelinux-8-ansible-node](src/dockerfile/oraclelinux-8-ansible-node/Dockerfile) |
| `fedora-33-ansible-node:0.1.0`     | fedora      | `docker.io/library/fedora:33`       | [fedora-33-ansible-node](src/dockerfile/fedora-33-ansible-node/Dockerfile)         |
| `centos-8-ansible-node:0.1.0`      | centos      | `docker.io/library/centos:8`        | [centos-8-ansible-node](src/dockerfile/centos-8-ansible-node/Dockerfile)           |

### Container collection: Bash Test

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core

| Image:Tag                        | OS          | Base Image                          | Source File                                                                    |
| -------------------------------- | ----------- | ----------------------------------- | ------------------------------------------------------------------------------ |
| `ubuntu-20.4-basth-test:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:20.04`    | [ubuntu-20.4-basth-test](src/dockerfile/ubuntu-20.4-basth-test/Dockerfile)     |
| `ubuntu-21.4-basth-test:0.1.0`   | ubuntu      | `docker.io/library/ubuntu:21.04`    | [ubuntu-21.4-basth-test](src/dockerfile/ubuntu-21.4-basth-test/Dockerfile)     |
| `debian-10-basth-test:0.1.0`     | debian      | `docker.io/library/debian:buster`   | [debian-10-basth-test](src/dockerfile/debian-10-basth-test/Dockerfile)         |
| `debian-11-basth-test:0.1.0`     | debian      | `docker.io/library/debian:bullseye` | [debian-11-basth-test](src/dockerfile/debian-11-basth-test/Dockerfile)         |
| `oraclelinux-8-basth-test:0.1.0` | oraclelinux | `docker.io/library/oraclelinux:8`   | [oraclelinux-8-basth-test](src/dockerfile/oraclelinux-8-basth-test/Dockerfile) |
| `fedora-33-basth-test:0.1.0`     | fedora      | `docker.io/library/fedora:33`       | [fedora-33-basth-test](src/dockerfile/fedora-33-basth-test/Dockerfile)         |
| `centos-8-basth-test:0.1.0`      | centos      | `docker.io/library/centos:8`        | [centos-8-basth-test](src/dockerfile/centos-8-basth-test/Dockerfile)           |

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
