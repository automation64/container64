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
      - [Container collection: Base container image](#container-collection-base-container-image)
      - [Container collection: System Administration toolbox](#container-collection-system-administration-toolbox)
      - [Container collection: Development environment](#container-collection-development-environment)
      - [Container collection: Bash testing](#container-collection-bash-testing)
      - [Container collection: Ansible playbooks testing](#container-collection-ansible-playbooks-testing)
      - [Container collection: Bash linting](#container-collection-bash-linting)
      - [Container collection: Terraform linting](#container-collection-terraform-linting)
      - [Container collection: K8S linting](#container-collection-k8s-linting)
      - [Container collection: YAML linting](#container-collection-yaml-linting)
      - [Container collection: Container linting](#container-collection-container-linting)
      - [Container collection: Terraform testing](#container-collection-terraform-testing)
      - [Container collection: Static Site Generator linting](#container-collection-static-site-generator-linting)
      - [Container collection: Go testing](#container-collection-go-testing)
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

#### Container collection: Mirror container image

- Purpose: Mirror container image for freezing unversioned sources

| Image                            | OS        | Base Image                              |
| -------------------------------- | --------- | --------------------------------------- |
| `mirror/kalilinux-2024.3-mirror` | kalilinux | `docker.io/kalilinux/kali-last-release` |
| `mirror/kalilinux-2025.5-mirror` | kalilinux | `docker.io/kalilinux/kali-last-release` |

#### Container collection: Base container image

- Purpose: Base container image for creating Container64 images
- Packages: sudo

| Image                        | OS          | Base Image                                            |
| ---------------------------- | ----------- | ----------------------------------------------------- |
| `base/almalinux-8-base`      | almalinux   | `docker.io/library/almalinux:8`                       |
| `base/alpine-3-base`         | alpine      | `docker.io/library/alpine:3.17`                       |
| `base/alpine-3.20-base`      | alpine      | `docker.io/library/alpine:3.20`                       |
| `base/alpine-3.21-base`      | alpine      | `docker.io/library/alpine:3.21`                       |
| `base/amazonlinux-2023-base` | almalinux   | `docker.io/amazonlinux:2023`                          |
| `base/centos-7-base`         | centos      | `quay.io/centos/centos:centos7`                       |
| `base/centos-8-base`         | centos      | `quay.io/centos/centos:8`                             |
| `base/centos-9-base`         | centos      | `quay.io/centos/centos:stream9`                       |
| `base/debian-10-base`        | debian      | `docker.io/library/debian:buster`                     |
| `base/debian-11-base`        | debian      | `docker.io/library/debian:bullseye`                   |
| `base/debian-12-base`        | debian      | `docker.io/library/debian:bookworm`                   |
| `base/debian-9-base`         | debian      | `docker.io/debian/eol:stretch`                        |
| `base/fedora-33-base`        | fedora      | `docker.io/library/fedora:33`                         |
| `base/fedora-34-base`        | fedora      | `docker.io/library/fedora:34`                         |
| `base/fedora-35-base`        | fedora      | `docker.io/library/fedora:35`                         |
| `base/fedora-36-base`        | fedora      | `docker.io/library/fedora:36`                         |
| `base/fedora-37-base`        | fedora      | `docker.io/library/fedora:37`                         |
| `base/fedora-38-base`        | fedora      | `docker.io/library/fedora:38`                         |
| `base/fedora-39-base`        | fedora      | `docker.io/library/fedora:39`                         |
| `base/fedora-40-base`        | fedora      | `docker.io/library/fedora:40`                         |
| `base/fedora-41-base`        | fedora      | `docker.io/library/fedora:41`                         |
| `base/fedora-42-base`        | fedora      | `docker.io/library/fedora:42`                         |
| `base/kalilinux-2024.3-base` | kalilinux   | `ghcr.io/automation64/mirror/kalilinux-2024.3-mirror` |
| `base/oraclelinux-7-base`    | oraclelinux | `docker.io/library/oraclelinux:7`                     |
| `base/oraclelinux-8-base`    | oraclelinux | `docker.io/library/oraclelinux:8`                     |
| `base/oraclelinux-9-base`    | oraclelinux | `docker.io/library/oraclelinux:9`                     |
| `base/rhel-8-base`           | rhel        | `docker.io/redhat/ubi8`                               |
| `base/rhel-9-base`           | rhel        | `docker.io/redhat/ubi9`                               |
| `base/rockylinux-8-base`     | rockylinux  | `docker.io/rockylinux:8`                              |
| `base/rockylinux-9-base`     | rockylinux  | `docker.io/rockylinux:9`                              |
| `base/sles-15-base`          | sles        | `registry.suse.com/bci/bci-base:15`                   |
| `base/ubuntu-18.4-base`      | ubuntu      | `docker.io/library/ubuntu:18.04`                      |
| `base/ubuntu-20.4-base`      | ubuntu      | `docker.io/library/ubuntu:20.04`                      |
| `base/ubuntu-21.4-base`      | ubuntu      | `docker.io/library/ubuntu:21.04`                      |
| `base/ubuntu-22.4-base`      | ubuntu      | `docker.io/library/ubuntu:22.04`                      |
| `base/ubuntu-24.4-base`      | ubuntu      | `docker.io/library/ubuntu:24.04`                      |
| `base/ubuntu-25.4-base`      | ubuntu      | `docker.io/library/ubuntu:25.04`                      |

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
| `toolbox/oraclelinux-9-toolbox-iac`          | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-k8s`          | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-mongodbcli-5` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-mongodbcli-6` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-psqlcli-13`   | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox-terraform`    | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-cloud:latest`   |
| `toolbox/oraclelinux-9-toolbox`              | oraclelinux | `docker.io/library/oraclelinux:9`                           |

#### Container collection: Development environment

- Purpose: Development environment
- Packages: dev tools, languages

| Image                           | OS     | Base Image                                              |
| ------------------------------- | ------ | ------------------------------------------------------- |
| `dev/ubuntu-22.4-dev-ansible`   | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-bash`      | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-cloud`     | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-container` | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-iac`       | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest` |
| `dev/ubuntu-22.4-dev-gitops`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest` |
| `dev/ubuntu-22.4-dev-go`        | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-hugo`      | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-iac`       | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest` |
| `dev/ubuntu-22.4-dev-jekyll`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-k8s`       | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest` |
| `dev/ubuntu-22.4-dev-nodejs`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-python`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-mkdocs`    | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev:latest`       |
| `dev/ubuntu-22.4-dev-sql`       | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-dev-cloud:latest` |
| `dev/ubuntu-22.4-dev-terraform` | Ubuntu | `ghcr.io/automation64/dev/ubuntu-22.4-cloud:latest`     |
| `dev/ubuntu-22.4-dev`           | Ubuntu | `ghcr.io/automation64/base/ubuntu-22.4-base:latest`     |

#### Container collection: Bash testing

- Purpose: Bash scripts testing
- Packages: Bash, Bats Core, Bash Core plugins

| Image                                            | OS          | Base Image                                                 |
| ------------------------------------------------ | ----------- | ---------------------------------------------------------- |
| `bash-test/almalinux-8-bash-test`                | almalinux   | `ghcr.io/automation64/base/almalinux-8-base:latest`        |
| `bash-test/almalinux-9-bash-test`                | almalinux   | `ghcr.io/automation64/base/almalinux-9-base:latest`        |
| `bash-test/alpine-3-bash-test`                   | alpine      | `ghcr.io/automation64/base/alpine-3-base:latest`           |
| `bash-test/alpine-3.20-bash-test`                | alpine      | `ghcr.io/automation64/base/alpine-3.20-base:latest`        |
| `bash-test/alpine-3.21-bash-test`                | alpine      | `ghcr.io/automation64/base/alpine-3.21-base:latest`        |
| `bash-test/amazonlinux-2023-bash-test`           | almalinux   | `ghcr.io/automation64/base/amazonlinux-2023-base:latest`   |
| `bash-test/centos-7-bash-test`                   | centos      | `ghcr.io/automation64/base/centos-7-base:latest`           |
| `bash-test/centos-8-bash-test`                   | centos      | `ghcr.io/automation64/base/centos-8-base:latest`           |
| `bash-test/centos-9-bash-test`                   | centos      | `ghcr.io/automation64/base/centos-9-base:latest`           |
| `bash-test/debian-10-bash-test`                  | debian      | `ghcr.io/automation64/base/debian-10-base:latest`          |
| `bash-test/debian-11-bash-test`                  | debian      | `ghcr.io/automation64/base/debian-11-base:latest`          |
| `bash-test/debian-9-bash-test`                   | debian      | `ghcr.io/automation64/base/debian-9-base:latest`           |
| `bash-test/fedora-33-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-33-base:latest`          |
| `bash-test/fedora-34-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-34-base:latest`          |
| `bash-test/fedora-35-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-35-base:latest`          |
| `bash-test/fedora-36-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-36-base:latest`          |
| `bash-test/fedora-37-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-37-base:latest`          |
| `bash-test/fedora-38-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-38-base:latest`          |
| `bash-test/fedora-39-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-39-base:latest`          |
| `bash-test/fedora-40-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-40-base:latest`          |
| `bash-test/fedora-41-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-41-base:latest`          |
| `bash-test/fedora-42-bash-test`                  | fedora      | `ghcr.io/automation64/base/fedora-42-base:latest`          |
| `bash-test/kalilinux-2024.3-bash-test`           | fedora      | `ghcr.io/automation64/base/kalilinux-2024.3-base:latest`   |
| `bash-test/oraclelinux-7-bash-test`              | oraclelinux | `ghcr.io/automation64/base/oraclelinux-7-base:latest`      |
| `bash-test/oraclelinux-8-bash-test`              | oraclelinux | `ghcr.io/automation64/base/oraclelinux-8-base:latest`      |
| `bash-test/oraclelinux-9-bash-test-ansible`      | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-cloud`        | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-docker`       | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-k8s`          | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-mongodbcli-6` | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-podman`       | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test-terraform`    | oraclelinux | `ghcr.io/automation64/bash-test/oraclelinux-9-base:latest` |
| `bash-test/oraclelinux-9-bash-test`              | oraclelinux | `ghcr.io/automation64/base/oraclelinux-9-base:latest`      |
| `bash-test/rhel-8-bash-test`                     | rhel        | `ghcr.io/automation64/base/rhel-8-base:latest`             |
| `bash-test/rhel-9-bash-test`                     | rhel        | `ghcr.io/automation64/base/rhel-9-base:latest`             |
| `bash-test/rockylinux-8-bash-test`               | rockylinux  | `ghcr.io/automation64/base/rockylinux-8-base:latest`       |
| `bash-test/rockylinux-9-bash-test`               | rockylinux  | `ghcr.io/automation64/base/rockylinux-9-base:latest`       |
| `bash-test/sles-15-bash-test`                    | sles        | `ghcr.io/automation64/base/sles-15-base:latest`            |
| `bash-test/ubuntu-18.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-18.4-base:latest`        |
| `bash-test/ubuntu-20.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-20.4-base:latest`        |
| `bash-test/ubuntu-21.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-21.4-base:latest`        |
| `bash-test/ubuntu-22.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-22.4-base:latest`        |
| `bash-test/ubuntu-24.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-24.4-base:latest`        |
| `bash-test/ubuntu-25.4-bash-test`                | ubuntu      | `ghcr.io/automation64/base/ubuntu-25.4-base:latest`        |

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

#### Container collection: Bash linting

- Purpose: Unix Shell scripts linting
- Packages: ShellCheck, OS utilities

| Image                            | OS     | Base Image                                       |
| -------------------------------- | ------ | ------------------------------------------------ |
| `shell-lint/alpine-3-shell-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: Terraform linting

- Purpose: Terraform code linting
- Packages: TFLint

| Image                                    | OS     | Base Image                                       |
| ---------------------------------------- | ------ | ------------------------------------------------ |
| `terraform-lint/alpine-3-terraform-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: K8S linting

- Purpose: K8s manifests linting
- Packages: kube-linter, helm, helm-ct, kubectl

| Image                        | OS     | Base Image                                       |
| ---------------------------- | ------ | ------------------------------------------------ |
| `k8s-lint/alpine-3-k8s-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: YAML linting

- Purpose: YAML code linting
- Packages: YAMLLint

| Image                          | OS     | Base Image                                       |
| ------------------------------ | ------ | ------------------------------------------------ |
| `yaml-lint/alpine-3-yaml-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: Container linting

- Purpose: Container code linting
- Packages: Hadolint

| Image                                    | OS     | Base Image                                       |
| ---------------------------------------- | ------ | ------------------------------------------------ |
| `container-lint/alpine-3-container-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: Terraform testing

- Purpose: Terraform code testing
- Packages: TFSec, TFLint, Terraform

| Image                                         | OS          | Base Image                                                            |
| --------------------------------------------- | ----------- | --------------------------------------------------------------------- |
| `terraform-test/oraclelinux-9-terraform-test` | oraclelinux | `ghcr.io/automation64/toolbox/oraclelinux-9-toolbox-terraform:latest` |

#### Container collection: Static Site Generator linting

- Purpose: Static Site Generator linting
- Packages: MKDocs

| Image                        | OS     | Base Image                                       |
| ---------------------------- | ------ | ------------------------------------------------ |
| `ssg-lint/alpine-3-ssg-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: Go testing

- Purpose: Go code testing
- Packages: golang

| Image                             | OS     | Base Image                                       |
| --------------------------------- | ------ | ------------------------------------------------ |
| `go-test/alpine-3-container-lint` | alpine | `ghcr.io/automation64/base/alpine-3-base:latest` |

#### Container collection: Penetration testing

- Purpose: Penetration testing tools for security compliance checking

| Image                                | OS        | Base Image                                               |
| ------------------------------------ | --------- | -------------------------------------------------------- |
| `pen-test/kalilinux-2024.3-pen-test` | kalilinux | `ghcr.io/automation64/base/kalilinux-2024.3-base:latest` |

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
