# Contributing

## Prepare Development Environment

- Prepare dev tools
  - Install GIT
  - Install GIT-Flow
  - Install Docker or Podman
- Clone GIT repository

  ```shell
  git clone https://github.com/serdigital64/container64.git
  ```

- Adjust environment variables to match your configuration:

  - Copy environment definition files from templates:

  ```shell
  cp dot.local .local
  cp dot.secrets .secrets
  ```

  - Review and update content for both files to match your environment

- Download dev support scripts

  ```shell
  ./bin/dev-lib
  ```

- Initialize git-flow. Leave defaults options

  ```shell
  git flow init
  ```

## Update source code

- Add/Edit source code in: `src/`

## Build container image

```shell
./cntbuild -b -c CONTAINER_NAME -e TAG
```

## Publish container image

```shell
./cntbuild -u -c CONTAINER_NAME -e TAG
```

## Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)
- Project Documentation: [https://serdigital64.github.io/container64/](https://serdigital64.github.io/container64/)
