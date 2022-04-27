# Contributing

## Development

### Environment

- Prepare dev tools
  - Install GIT
  - Install Docker or Podman
- Clone GIT repository

  ```shell
  git clone https://github.com/serdigital64/container64.git
  ```

- Adjust environment variables to reflect your configuration:

  ```shell
  # Copy environment definition files from templates:
  cp dot.local .local
  cp dot.secrets .secrets
  # Review and update content for both files
  ```

- Initialize dev environment variables

  ```shell
  source bin/devcnt-set
  ```

## Repositories

- Project GIT repository: [https://github.com/serdigital64/container64](https://github.com/serdigital64/container64)
- Project Documentation: [https://serdigital64.github.io/container64/](https://serdigital64.github.io/container64/)
