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
      - [Container collection: Mirror container image](#container-collection-mirror-container-image)
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
      - [Container collection: Penetration testing](#container-collection-penetration-testing)
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
- [Dockerfiles](src/dockerfiles/mirror)

#### Container collection: Base container image

- Purpose: Base container image for creating Container64 images
- [Dockerfiles](src/dockerfiles/base)

#### Container collection: System Administration toolbox

- Purpose: Linux systems administration
- [Dockerfiles](src/dockerfiles/toolbox)

#### Container collection: Development environment

- Purpose: Development environment
- [Dockerfiles](src/dockerfiles/dev)

#### Container collection: Bash testing

- Purpose: Bash scripts testing
- [Dockerfiles](src/dockerfiles/bash-test)

#### Container collection: Ansible playbooks testing

- Purpose: Ansible playbooks testing
- [Dockerfiles](src/dockerfiles/ansible-test)

#### Container collection: Bash linting

- Purpose: Unix Shell scripts linting
- [Dockerfiles](src/dockerfiles/shell-lint)

#### Container collection: Terraform linting

- Purpose: Terraform code linting
- [Dockerfiles](src/dockerfiles/terraform-lint)

#### Container collection: K8S linting

- Purpose: K8s manifests linting
- [Dockerfiles](src/dockerfiles/k8s-lint)

#### Container collection: YAML linting

- Purpose: YAML code linting
- [Dockerfiles](src/dockerfiles/yaml-lint)

#### Container collection: Container linting

- Purpose: Container code linting
- Packages: - [Dockerfiles](src/dockerfiles/container-lint)

#### Container collection: Terraform testing

- Purpose: Terraform code testing
- [Dockerfiles](src/dockerfiles/terraform-test)

#### Container collection: Static Site Generator linting

- Purpose: Static Site Generator linting
- [Dockerfiles](src/dockerfiles/ssg-lint)

#### Container collection: Go testing

- Purpose: Go code testing
- [Dockerfiles](src/dockerfiles/go-test)

#### Container collection: Penetration testing

- Purpose: Penetration testing tools for security compliance checking
- [Dockerfiles](src/dockerfiles/pen-test)

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
- `CNT64_OPT_ROOT/<APPLICATION>`
- `CNT64_LOCAL_ROOT=/usr/local`
- `CNT64_LOCAL_BIN=/usr/local/bin`

#### Application Installers

Stand-alone Bash based scripts for installing individual application packages.
Installers are maintained separately and downloaded at build time from the [Installer64](https://github.com/automation64/installer64) project

- Installers are purpose build for container environments or similar (CICD runners, etc)
- Installers will consume Container64 global environment variables as needed
- Installer specific parameters are defined as shell exported variables that must be defined before script execution (i.e.: via Dockerfile, CICD, etc)
- Default location: `CNT64_INSTALLER_ROOT`

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
