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
| `toolbox/oraclelinux-8-toolbox-cloud`     | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox-mongosh-5` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox-mongosh-6` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox-psql-13`   | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-8-toolbox:latest` |
| `toolbox/oraclelinux-8-toolbox`           | oraclelinux | `docker.io/library/oraclelinux:8`                           |
| `toolbox/oraclelinux-9-toolbox-ansible`   | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-cloud`     | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-k8s`       | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-mongosh-5` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-mongosh-6` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-psql-13`   | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-terraform` | oraclelinux | `ghcr.io/serdigital64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox`           | oraclelinux | `docker.io/library/oraclelinux:9`                           |

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

### Container collection: Ansible playbooks testing

- Purpose: Ansible playbooks testing
- Packages: SystemD, Sudo, Python3, Ansible

| Image                                     | OS          | Base Image                          |
| ----------------------------------------- | ----------- | ----------------------------------- |
| `ansible-test/almalinux-8-ansible-test`   | almalinux   | `docker.io/library/almalinux:8`     |
| `ansible-test/centos-8-ansible-test`      | centos      | `docker.io/library/centos:8`        |
| `ansible-test/debian-10-ansible-test`     | debian      | `docker.io/library/debian:buster`   |
| `ansible-test/debian-11-ansible-test`     | debian      | `docker.io/library/debian:bullseye` |
| `ansible-test/fedora-33-ansible-test`     | fedora      | `docker.io/library/fedora:33`       |
| `ansible-test/fedora-35-ansible-test`     | fedora      | `docker.io/library/fedora:35`       |
| `ansible-test/fedora-36-ansible-test`     | fedora      | `docker.io/library/fedora:36`       |
| `ansible-test/oraclelinux-8-ansible-test` | oraclelinux | `docker.io/library/oraclelinux:8`   |
| `ansible-test/oraclelinux-9-ansible-test` | oraclelinux | `docker.io/library/oraclelinux:9`   |
| `ansible-test/rhel-8-ansible-test`        | rhel        | `docker.io/redhat/ubi8:latest`      |
| `ansible-test/rockylinux-8-ansible-test`  | rhel        | `docker.io/rockylinux:8`            |
| `ansible-test/ubuntu-20.4-ansible-test`   | ubuntu      | `docker.io/library/ubuntu:20.04`    |
| `ansible-test/ubuntu-21.4-ansible-test`   | ubuntu      | `docker.io/library/ubuntu:21.04`    |
| `ansible-test/ubuntu-22.4-ansible-test`   | ubuntu      | `docker.io/library/ubuntu:22.04`    |
| `ansible-test/ubuntu-23.04-ansible-test`   | ubuntu      | `docker.io/library/ubuntu:23.04`    |

### Container collection: Bash Testing

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                                         | OS          | Base Image                                       |
| --------------------------------------------- | ----------- | ------------------------------------------------ |
| `bash-test/almalinux-8-bash-test`             | almalinux   | `docker.io/library/almalinux:8`                  |
| `bash-test/almalinux-9-bash-test`             | almalinux   | `docker.io/library/almalinux:9`                  |
| `bash-test/alpine-3-bash-test`                | alpine      | `docker.io/library/alpine:3`                     |
| `bash-test/centos-7-bash-test`                | centos      | `quay.io/centos/centos:centos7`                  |
| `bash-test/centos-8-bash-test`                | centos      | `quay.io/centos/centos:8`                        |
| `bash-test/centos-9-bash-test`                | centos      | `quay.io/centos/centos:stream9`                  |
| `bash-test/debian-10-bash-test`               | debian      | `docker.io/library/debian:buster`                |
| `bash-test/debian-11-bash-test`               | debian      | `docker.io/library/debian:bullseye`              |
| `bash-test/debian-9-bash-test`                | debian      | `docker.io/library/debian:stretch`               |
| `bash-test/fedora-33-bash-test`               | fedora      | `docker.io/library/fedora:33`                    |
| `bash-test/fedora-34-bash-test`               | fedora      | `docker.io/library/fedora:34`                    |
| `bash-test/fedora-35-bash-test`               | fedora      | `docker.io/library/fedora:35`                    |
| `bash-test/fedora-36-bash-test`               | fedora      | `docker.io/library/fedora:36`                    |
| `bash-test/fedora-37-bash-test`               | fedora      | `docker.io/library/fedora:37`                    |
| `bash-test/oraclelinux-7-bash-test`           | oraclelinux | `docker.io/library/oraclelinux:7`                |
| `bash-test/oraclelinux-8-bash-test-psql-13`   | oraclelinux | `toolbox/oraclelinux-8-toolbox-psql-13:latest`   |
| `bash-test/oraclelinux-8-bash-test`           | oraclelinux | `docker.io/library/oraclelinux:8`                |
| `bash-test/oraclelinux-9-bash-test-ansible-2` | oraclelinux | `toolbox/oraclelinux-9-toolbox-ansible-2:latest` |
| `bash-test/oraclelinux-9-bash-test-cloud`     | oraclelinux | `toolbox/oraclelinux-9-toolbox-cloud:latest`     |
| `bash-test/oraclelinux-9-bash-test-docker`    | oraclelinux | `bash-test/oraclelinux-9-bash-test:latest`       |
| `bash-test/oraclelinux-9-bash-test-k8s`       | oraclelinux | `toolbox/oraclelinux-9-toolbox-k8s:latest`       |
| `bash-test/oraclelinux-9-bash-test-mongosh-6` | oraclelinux | `toolbox/oraclelinux-9-toolbox-mongosh-6:latest` |
| `bash-test/oraclelinux-9-bash-test-podman`    | oraclelinux | `bash-test/oraclelinux-9-bash-test:latest`       |
| `bash-test/oraclelinux-9-bash-test-terraform` | oraclelinux | `toolbox/oraclelinux-9-toolbox-terraform:latest` |
| `bash-test/oraclelinux-9-bash-test`           | oraclelinux | `docker.io/library/oraclelinux:9`                |
| `bash-test/rhel-8-bash-test`                  | rhel        | `docker.io/redhat/ubi8`                          |
| `bash-test/rhel-9-bash-test`                  | rhel        | `docker.io/redhat/ubi9`                          |
| `bash-test/rockylinux-8-bash-test`            | rockylinux  | `docker.io/rockylinux:8`                         |
| `bash-test/rockylinux-9-bash-test`            | rockylinux  | `docker.io/rockylinux:9`                         |
| `bash-test/sles-15-bash-test`                 | sles        | `registry.suse.com/bci/bci-base:15`              |
| `bash-test/ubuntu-20.4-bash-test`             | ubuntu      | `docker.io/library/ubuntu:20.04`                 |
| `bash-test/ubuntu-21.4-bash-test`             | ubuntu      | `docker.io/library/ubuntu:21.04`                 |
| `bash-test/ubuntu-22.4-bash-test`             | ubuntu      | `docker.io/library/ubuntu:22.04`                 |
| `bash-test/ubuntu-23.04-bash-test`             | ubuntu      | `docker.io/library/ubuntu:23.04`                 |

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
