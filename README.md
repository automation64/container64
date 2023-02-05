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

**Container64** is a catalog of OCI compliant container images for infrastructure management.

### Container collection: Linux System Administration toolbox

- Purpose: Linux systems administration
- Packages: common os management tools

| Image                                     | OS          | Base Image                                                  |
| ----------------------------------------- | ----------- | ----------------------------------------------------------- |
| `toolbox/oraclelinux-8-toolbox`           | oraclelinux | `docker.io/library/oraclelinux:8`                           |
| `toolbox/oraclelinux-9-toolbox`           | oraclelinux | `docker.io/library/oraclelinux:9`                           |
| `toolbox/oraclelinux-8-toolbox-cloud`     | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-cloud`     | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-k8s`       | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-8-toolbox-mongosh-5` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox-mongosh-6` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox-psql-13`   | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-terraform` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-cloud:latest`   |

### Container collection: Bash Linter

- Purpose: Unix Shell scripts linting
- Packages: ShellCheck, OS utilities

| Image                            | OS     | Base Image                   |
| -------------------------------- | ------ | ---------------------------- |
| `shell-lint/alpine-3-shell-lint` | alpine | `docker.io/library/alpine:3` |

### Container collection: Terraform projects testing

- Purpose: Terraform code testing
- Packages: TFSec, TFLint, Terraform

| Image                                         | OS          | Base Image                                                            |
| --------------------------------------------- | ----------- | --------------------------------------------------------------------- |
| `terraform-test/oraclelinux-9-terraform-test` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox-terraform:latest` |

### Container collection: Ansible Node

- Purpose: Ansible node
- Packages: SystemD, Sudo, Python3

| Image                                     | OS          | Base Image                          |
| ----------------------------------------- | ----------- | ----------------------------------- |
| `ansible-node/almalinux-8-ansible-node`   | almalinux   | `docker.io/library/almalinux:8`     |
| `ansible-node/centos-8-ansible-node`      | centos      | `docker.io/library/centos:8`        |
| `ansible-node/debian-10-ansible-node`     | debian      | `docker.io/library/debian:buster`   |
| `ansible-node/debian-11-ansible-node`     | debian      | `docker.io/library/debian:bullseye` |
| `ansible-node/fedora-33-ansible-node`     | fedora      | `docker.io/library/fedora:33`       |
| `ansible-node/fedora-35-ansible-node`     | fedora      | `docker.io/library/fedora:35`       |
| `ansible-node/fedora-36-ansible-node`     | fedora      | `docker.io/library/fedora:36`       |
| `ansible-node/oraclelinux-8-ansible-node` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `ansible-node/oraclelinux-9-ansible-node` | oraclelinux | `docker.io/library/oraclelinux:9`   |
| `ansible-node/rockylinux-8-ansible-node`  | rhel        | `docker.io/rockylinux:8`            |
| `ansible-node/rhel-8-ansible-node`        | rhel        | `docker.io/redhat/ubi8:latest`      |
| `ansible-node/ubuntu-20.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ansible-node/ubuntu-21.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |
| `ansible-node/ubuntu-22.4-ansible-node`   | ubuntu      | `docker.io/library/ubuntu:22.04`    |

### Container collection: Bash Testing

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                               | OS          | Base Image                          |
| ----------------------------------- | ----------- | ----------------------------------- |
| `bash-test/almalinux-8-bash-test`   | almalinux   | `docker.io/library/almalinux:8`     |
| `bash-test/alpine-3-bash-test`      | alpine      | `docker.io/library/alpine:3`        |
| `bash-test/centos-7-bash-test`      | centos      | `quay.io/centos/centos:centos7`     |
| `bash-test/centos-8-bash-test`      | centos      | `quay.io/centos/centos:8`           |
| `bash-test/centos-9-bash-test`      | centos      | `quay.io/centos/centos:stream9`     |
| `bash-test/debian-9-bash-test`      | debian      | `docker.io/library/debian:stretch`  |
| `bash-test/debian-10-bash-test`     | debian      | `docker.io/library/debian:buster`   |
| `bash-test/debian-11-bash-test`     | debian      | `docker.io/library/debian:bullseye` |
| `bash-test/fedora-33-bash-test`     | fedora      | `docker.io/library/fedora:33`       |
| `bash-test/fedora-34-bash-test`     | fedora      | `docker.io/library/fedora:34`       |
| `bash-test/fedora-35-bash-test`     | fedora      | `docker.io/library/fedora:35`       |
| `bash-test/fedora-36-bash-test`     | fedora      | `docker.io/library/fedora:36`       |
| `bash-test/oraclelinux-7-bash-test` | oraclelinux | `docker.io/library/oraclelinux:7`   |
| `bash-test/oraclelinux-8-bash-test` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `bash-test/oraclelinux-9-bash-test` | oraclelinux | `docker.io/library/oraclelinux:9`   |
| `bash-test/rockylinux-8-bash-test`  | rockylinux  | `docker.io/rockylinux:8`            |
| `bash-test/rhel-8-bash-test`        | rhel        | `docker.io/redhat/ubi8`             |
| `bash-test/rhel-9-bash-test`        | rhel        | `docker.io/redhat/ubi9`             |
| `bash-test/ubuntu-20.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `bash-test/ubuntu-21.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |
| `bash-test/ubuntu-22.4-bash-test`   | ubuntu      | `docker.io/library/ubuntu:22.04`    |

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

- [Guidelines](https://github.com/serdigital64/container64/blob/master/CONTRIBUTING.md)
- [Contributor Covenant Code of Conduct](https://github.com/serdigital64/container64/blob/master/CODE_OF_CONDUCT.md)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

## Author

- [SerDigital64](https://github.com/serdigital64)
