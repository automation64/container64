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

- [Project: Container64](#project-container64)
  - [Overview](#overview)
    - [Container Catalog](#container-catalog)
      - [Container collection: Base](#container-collection-base)
      - [Container collection: System Administration toolbox](#container-collection-system-administration-toolbox)
      - [Container collection: Dev](#container-collection-dev)
      - [Container collection: Run](#container-collection-run)
      - [Container collection: Bash Linter](#container-collection-bash-linter)
      - [Container collection: Bash Testing](#container-collection-bash-testing)
      - [Container collection: Terraform projects linting](#container-collection-terraform-projects-linting)
      - [Container collection: Terraform projects testing](#container-collection-terraform-projects-testing)
      - [Container collection: Ansible playbooks testing](#container-collection-ansible-playbooks-testing)
      - [Container collection: Static Site Generator linter](#container-collection-static-site-generator-linter)
    - [Container structure](#container-structure)
      - [Global environment variables](#global-environment-variables)
      - [Shared Directories](#shared-directories)
      - [Application Installers](#application-installers)
      - [Global Tools](#global-tools)
  - [Usage](#usage)
  - [Deployment](#deployment)
    - [Requirements](#requirements)
    - [Installation](#installation)
  - [Contributing](#contributing)
  - [License](#license)
  - [Author](#author)

## Overview

**Container64** is a catalog of purpose build container images for infrastructure management, development and testing.

### Container Catalog

#### Container collection: Base

- Purpose: Base container image for creating Container64 images
- Packages: sudo

| Image                     | OS          | Base Image                        |
| ------------------------- | ----------- | --------------------------------- |
| `base/alpine-3-base`      | alpine      | `docker.io/library/alpine:3.17`   |
| `base/oraclelinux-9-base` | oraclelinux | `docker.io/library/oraclelinux:9` |
| `base/ubuntu-22.4-base`   | ubuntu      | `docker.io/library/ubuntu:22.04`  |

#### Container collection: System Administration toolbox

- Purpose: Linux systems administration
- Packages: common os management tools

| Image                                        | OS          | Base Image                                                  |
| -------------------------------------------- | ----------- | ----------------------------------------------------------- |
| `toolbox/oraclelinux-8-toolbox`              | oraclelinux | `docker.io/library/oraclelinux:8`                           |
| `toolbox/oraclelinux-9-toolbox-ansible`      | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-cloud`        | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-container`    | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-toolbox:latest` |
| `toolbox/oraclelinux-9-toolbox-db`           | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-gitops`       | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-k8s:latest`     |
| `toolbox/oraclelinux-9-toolbox-k8s`          | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-mongodbcli-5` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-mongodbcli-6` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-psqlcli-13`   | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-terraform`    | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox`              | oraclelinux | `docker.io/library/oraclelinux:9`                           |

#### Container collection: Dev

- Purpose: Development environment
- Packages: dev tools, languages

| Image                           | OS     | Base Image                                            |
| ------------------------------- | ------ | ----------------------------------------------------- |
| `dev/ubuntu-22.4-dev`           | Ubuntu | `docker.io/library/ubuntu:22.04`                      |
| `dev/ubuntu-22.4-dev-ansible`   | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |
| `dev/ubuntu-22.4-dev-bash`      | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |
| `dev/ubuntu-22.4-dev-container` | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |
| `dev/ubuntu-22.4-dev-gitops`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-k8s:latest` |
| `dev/ubuntu-22.4-dev-go`        | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |
| `dev/ubuntu-22.4-dev-k8s`       | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |
| `dev/ubuntu-22.4-dev-mkdocs`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`     |

#### Container collection: Run

- Purpose: minimal runtime environment for running individual tools
- Packages: bash, sudo, curl, purpose specific tools

| Image              | OS     | Base Image                   |
| ------------------ | ------ | ---------------------------- |
| `run/alpine-3-run` | alpine | `docker.io/library/alpine:3` |

#### Container collection: Bash Linter

- Purpose: Unix Shell scripts linting
- Packages: ShellCheck, OS utilities

| Image                            | OS     | Base Image                   |
| -------------------------------- | ------ | ---------------------------- |
| `shell-lint/alpine-3-shell-lint` | alpine | `docker.io/library/alpine:3` |

#### Container collection: Bash Testing

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                                            | OS          | Base Image                                                      |
| ------------------------------------------------ | ----------- | --------------------------------------------------------------- |
| `bash-test/almalinux-8-bash-test`                | almalinux   | `docker.io/library/almalinux:8`                                 |
| `bash-test/almalinux-9-bash-test`                | almalinux   | `docker.io/library/almalinux:9`                                 |
| `bash-test/alpine-3-bash-test`                   | alpine      | `docker.io/library/alpine:3.17`                                 |
| `bash-test/centos-7-bash-test`                   | centos      | `quay.io/centos/centos:centos7`                                 |
| `bash-test/centos-8-bash-test`                   | centos      | `quay.io/centos/centos:8`                                       |
| `bash-test/centos-9-bash-test`                   | centos      | `quay.io/centos/centos:stream9`                                 |
| `bash-test/debian-10-bash-test`                  | debian      | `docker.io/library/debian:buster`                               |
| `bash-test/debian-11-bash-test`                  | debian      | `docker.io/library/debian:bullseye`                             |
| `bash-test/debian-9-bash-test`                   | debian      | `docker.io/debian/eol:stretch`                                  |
| `bash-test/fedora-33-bash-test`                  | fedora      | `docker.io/library/fedora:33`                                   |
| `bash-test/fedora-34-bash-test`                  | fedora      | `docker.io/library/fedora:34`                                   |
| `bash-test/fedora-35-bash-test`                  | fedora      | `docker.io/library/fedora:35`                                   |
| `bash-test/fedora-36-bash-test`                  | fedora      | `docker.io/library/fedora:36`                                   |
| `bash-test/fedora-37-bash-test`                  | fedora      | `docker.io/library/fedora:37`                                   |
| `bash-test/fedora-38-bash-test`                  | fedora      | `docker.io/library/fedora:38`                                   |
| `bash-test/fedora-39-bash-test`                  | fedora      | `docker.io/library/fedora:39`                                   |
| `bash-test/oraclelinux-7-bash-test`              | oraclelinux | `docker.io/library/oraclelinux:7`                               |
| `bash-test/oraclelinux-8-bash-test`              | oraclelinux | `docker.io/library/oraclelinux:8`                               |
| `bash-test/oraclelinux-9-bash-test-ansible`      | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-cloud`        | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-docker`       | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-k8s`          | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-mongodbcli-6` | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-podman`       | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test-terraform`    | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `bash-test/oraclelinux-9-bash-test`              | oraclelinux | `docker.io/library/oraclelinux:9`                               |
| `bash-test/rhel-8-bash-test`                     | rhel        | `docker.io/redhat/ubi8`                                         |
| `bash-test/rhel-9-bash-test`                     | rhel        | `docker.io/redhat/ubi9`                                         |
| `bash-test/rockylinux-8-bash-test`               | rockylinux  | `docker.io/rockylinux:8`                                        |
| `bash-test/rockylinux-9-bash-test`               | rockylinux  | `docker.io/rockylinux:9`                                        |
| `bash-test/sles-15-bash-test`                    | sles        | `registry.suse.com/bci/bci-base:15`                             |
| `bash-test/ubuntu-18.4-bash-test`                | ubuntu      | `docker.io/library/ubuntu:18.04`                                |
| `bash-test/ubuntu-20.4-bash-test`                | ubuntu      | `docker.io/library/ubuntu:20.04`                                |
| `bash-test/ubuntu-21.4-bash-test`                | ubuntu      | `docker.io/library/ubuntu:21.04`                                |
| `bash-test/ubuntu-22.10-bash-test`               | ubuntu      | `docker.io/library/ubuntu:22.10`                                |
| `bash-test/ubuntu-22.4-bash-test`                | ubuntu      | `docker.io/library/ubuntu:22.04`                                |
| `bash-test/ubuntu-23.4-bash-test`                | ubuntu      | `docker.io/library/ubuntu:23.04`                                |
| `bash-test/ubuntu-23.10-bash-test`               | ubuntu      | `docker.io/library/ubuntu:23.10`                                |

#### Container collection: Terraform projects linting

- Purpose: Terraform code linting
- Packages: TFLint

| Image                                    | OS     | Base Image                      |
| ---------------------------------------- | ------ | ------------------------------- |
| `terraform-lint/alpine-3-terraform-lint` | alpine | `docker.io/library/alpine:3.17` |

#### Container collection: Terraform projects testing

- Purpose: Terraform code testing
- Packages: TFSec, TFLint, Terraform

| Image                                         | OS          | Base Image                                                            |
| --------------------------------------------- | ----------- | --------------------------------------------------------------------- |
| `terraform-test/oraclelinux-9-terraform-test` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest` |
| `terraform-lint/oraclelinux-9-terraform-test` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest` |

#### Container collection: Ansible playbooks testing

- Purpose: Ansible playbooks testing
- Packages: SystemD, Sudo, Python3, Ansible

| Image                                     | OS          | Base Image                                                      |
| ----------------------------------------- | ----------- | --------------------------------------------------------------- |
| `ansible-test/almalinux-8-ansible-test`   | almalinux   | `ghcr.io/automation64/bash-test/almalinux-8-bash-test:latest`   |
| `ansible-test/centos-8-ansible-test`      | centos      | `ghcr.io/automation64/bash-test/centos-8-bash-test:latest`      |
| `ansible-test/debian-10-ansible-test`     | debian      | `ghcr.io/automation64/bash-test/debian-10-bash-test:latest`     |
| `ansible-test/debian-11-ansible-test`     | debian      | `ghcr.io/automation64/bash-test/debian-11-bash-test:latest`     |
| `ansible-test/fedora-33-ansible-test`     | fedora      | `ghcr.io/automation64/bash-test/fedora-33-bash-test:latest`     |
| `ansible-test/fedora-35-ansible-test`     | fedora      | `ghcr.io/automation64/bash-test/fedora-35-bash-test:latest`     |
| `ansible-test/fedora-36-ansible-test`     | fedora      | `ghcr.io/automation64/bash-test/fedora-36-bash-test:latest`     |
| `ansible-test/oraclelinux-8-ansible-test` | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-8-bash-test:latest` |
| `ansible-test/oraclelinux-9-ansible-test` | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-bash-test:latest` |
| `ansible-test/rhel-8-ansible-test`        | rhel        | `ghcr.io/automation64/bash-test/rhel-8-bash-test:latest`        |
| `ansible-test/rockylinux-8-ansible-test`  | rhel        | `ghcr.io/automation64/bash-test/rockylinux-8-bash-test:latest`  |
| `ansible-test/ubuntu-20.4-ansible-test`   | ubuntu      | `ghcr.io/automation64/bash-test/ubuntu-20.4-bash-test:latest`   |
| `ansible-test/ubuntu-21.4-ansible-test`   | ubuntu      | `ghcr.io/automation64/bash-test/ubuntu-21.4-bash-test:latest`   |
| `ansible-test/ubuntu-22.4-ansible-test`   | ubuntu      | `ghcr.io/automation64/bash-test/ubuntu-22.4-bash-test:latest`   |

#### Container collection: Static Site Generator linter

- Purpose: Static Site Generator linting
- Packages: MKDocs

| Image                        | OS     | Base Image                                       |
| ---------------------------- | ------ | ------------------------------------------------ |
| `ssg-lint/alpine-3-ssg-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

### Container structure

Container64 defines a base environment from where all images are built. The environment is described using shell environment variables to avoid hard-coding details in scripts.

#### Global environment variables

Born Shell compatible environment variables exported to be consumed by scripts

- `CNT64_BASHLIB64`: Bashlib64 location
- `CNT64_DEBUG`: Enable script debugging?. Assign any non-null value to enable
- `CNT64_INSTALLER_ROOT`: Container64 installers location
- `CNT64_LOCAL_BIN`: Searchable path for local executables
- `CNT64_LOCAL_ROOT`: Linux well-known base path for local content
- `CNT64_OPT_ROOT`: Linux well-known base path for non-os packaged content
- `CNT64_TMP`: System path for temporal files
- `CNT64_USER`: Image Run-As user

#### Shared Directories

Linux standard set of directories to be used by installers to deploy and publish applications for general usage:

- `CNT64_OPT_ROOT=/opt`
- `$CNT64_OPT_ROOT/<APPLICATION>`
- `CNT64_LOCAL_ROOT=/usr/local`
- `CNT64_LOCAL_BIN=/usr/local/bin`

#### Application Installers

Stand-alone Bash based scripts for installing individual application packages.
Installers are maintained separately and downloaded at build time from the [Installer64](https://github.com/automation64/installer64) project

- Installers are purpose build for container environments or similar (CICD runners, etc)
- Installers will consume Container64 global environment variables as needed
- Installer specific parameters are defined as shell exported variables that must be defined before script execution (i.e.: via Dockerfile, CICD, etc)
- Default location: `$CNT64_INSTALLER_ROOT`

#### Global Tools

Set of common tools that are available for all images.

- Bash
- CURL
- BashLib64: automation library for Bash scripts
- Installer64: application installers

## Usage

Run a command inside the container:

```shell
# Using docker:
docker run ghcr.io/automation64/<IMAGE> <COMMAND>
# Using podman:
podman run ghcr.io/automation64/<IMAGE> <COMMAND>
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
docker pull ghcr.io/automation64/<IMAGE>
# Using podman:
podman pull ghcr.io/automation64/<IMAGE>
```

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

- [Guidelines](https://github.com/automation64/container64/blob/master/CONTRIBUTING.md)
- [Contributor Covenant Code of Conduct](https://github.com/automation64/container64/blob/master/CODE_OF_CONDUCT.md)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)

## Author

- [SerDigital64](https://github.com/serdigital64)
