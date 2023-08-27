# Base Environment

## Overview

Container64 defines a base environment from where all images are built. The environment is described using shell environment variables to avoid hard-coding details in scripts.

## Components

### Global environment variables

Born Shell compatible environment variables exported to be consumed by scripts

- `CNT64_BASHLIB64`: Bashlib64 location
- `CNT64_DEBUG`: Enable script debugging?. Assign any non-null value to enable
- `CNT64_INSTALLER_ROOT`: Container64 installers location
- `CNT64_LOCAL_BIN`: Searchable path for local executables
- `CNT64_LOCAL_ROOT`: Linux well-known base path for local content
- `CNT64_OPT_ROOT`: Linux well-known base path for non-os packaged content
- `CNT64_TMP`: System path for temporal files
- `CNT64_USER`: Image Run-As user

### Shared Directories

Linux standard set of directories to be used by installers to deploy and publish applications for general usage:

- `CNT64_OPT_ROOT=/opt`
- `$CNT64_OPT_ROOT/<APPLICATION>`
- `CNT64_LOCAL_ROOT=/usr/local`
- `CNT64_LOCAL_BIN=/usr/local/bin`

### Application Installers

Stand-alone Bash based scripts for installing individual application packages.

- Installers are purpose build for container environments or similar (CICD runners, etc)
- Installers will consume Container64 global environment variables as needed
- Installer specific parameters are defined as shell exported variables that must be defined before script execution (i.e.: via Dockerfile, CICD, etc)
- Default location: `$CNT64_INSTALLER_ROOT`

### Global Tools

Set of common tools that are available for all images.

#### BashLib64

- Purpose: automation library for Bash scripts
- Default location: `$CNT64_BASHLIB64`
