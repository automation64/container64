# Base Environment

## Overview

Container64 defines a base environment from where all images are built. The environment is described using shell environment variables to avoid hard-coding details in scripts.

## Components

### Global environment variables

Born Shell compatible environment variables exported to be consumed by scripts

- `CNT64_DEBUG`: Enable script debugging?. Assign any non-null value to enable
- `CNT64_ROOT`: Container64 installers location
- `CNT64_USER`: Image Run-As user
- `CNT64_TMP`: System path for temporal files
- `CNT64_BASHLIB64`: Bashlib64 location
- `CNT64_PUBLIC_ROOT`: Linux well-known base path for local content
- `CNT64_PUBLIC_BIN`: Searchable path for local executables

### Shared Directories

Linux standard set of directories to be used by installers to deploy and publish applications for general usage:

- `/opt`: base directory for non OS-packaged applications (i.e.: stand-alone executables, etc)
- `/opt/<APPLICATION>`: dedicated directory for each non OS-packaged application
- `/usr/local`: whell-known location for local content
- `/usr/local/bin`: whell-known location where local executables are stored. Container64 uses this path to publish non OS-packaged applications via symlinks

### Application Installers

Stand-alone Bash based scripts for installing individual application packages.

- Installers are purpose build for container environments or similar (CICD runners, etc)
- Installers will consume Container64 global environment variables as needed
- Installer specific parameters are defined as shell exported variables that must be defined before script execution (i.e.: via Dockerfile, CICD, etc)
- Default location: `/opt/cnt64`

### Global Tools

Set of common tools that are available for all images.

#### BashLib64

- Purpose: automation library for Bash scripts
- Default location: `/opt/bl64`
