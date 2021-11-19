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

| Image:Tag                        | OS     | Base Image                       | Content                   | Source File                                                                 |
| -------------------------------- | ------ | -------------------------------- | ------------------------- | --------------------------------------------------------------------------- |
| `ubuntu-21.4-systemd-full:0.1.0` | ubuntu | `docker.io/library/ubuntu:21.04` | Full SystemD installation | [ubuntu-21.4-systemd-full](dockerfiles/ubuntu-21.4-systemd-full/Dockerfile) |

## Deployment

### Podman

`podman pull ghcr.io/serdigital64/<IMAGE>`

## Usage

### Podman

`podman run ghcr.io/serdigital64/<IMAGE> <COMMAND>`

## Source Code

Each image has a dedicated directory for storing the source file and additional artifacts.
Image directories are grouped based on the file format:

- [dockerfiles](dockerfiles/)

### Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)

### Author

- [SerDigital64](https://github.com/serdigital64)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
