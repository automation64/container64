# Contributing

## Prepare Development Environment

- Prepare dev tools
  - Install GIT
  - Install Docker or Podman
- Clone GIT repository

  ```shell
  git clone https://github.com/serdigital64/container64.git
  git flow init
  ```

- Adjust environment variables to reflect your configuration:

  ```shell
  # Copy environment definition files from templates:
  cp dot.local .local
  cp dot.secrets .secrets
  # Review and update content for both files
  ```

- Initialize dev environment

  ```shell
  ./bin/devcnt-lib
  ```

- Download the latest version of [BashLib64](https://github.com/serdigital64/bashlib64) to: `lib/` and 'src/loader'

## Update source code

- Add/Edit source code in: `src/dockerfiles`
- Build container image

```shell
./cntbuild -b -c CONTAINER_NAME -e TAG
```

- Publish container image

```shell
./cntbuild -u -c CONTAINER_NAME -e TAG
```

## Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)
- Project Documentation: [https://serdigital64.github.io/container64/](https://serdigital64.github.io/container64/)
