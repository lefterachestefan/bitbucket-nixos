# Modern Nix image for Bitbucket Pipelines

Bitbucket Pipelines runs some setup commands using absolute paths, which results
in errors with the minimal official Nix image:

```shell
/bin/sh: /usr/bin/mkfifo: No such file or directory
/bin/sh: /bin/echo: No such file or directory
```

This image works around the problem by symlinking the necessary binaries to the paths Bitbucket uses.

It is based on Nix 2.35.1, includes Git from the upstream image, and enables
flakes and flake-provided configuration by default.

## Usage

```yaml
pipelines:
  branches:
    main:
      - step:
          image: ghcr.io/YOUR_GITHUB_USERNAME/bitbucket-nixos:2.35.1
          name: Tests
          script:
            - nix develop -c YOUR_TEST_COMMAND
```

Use a versioned image tag instead of `latest` to keep CI reproducible.

## License

The project is licensed under the [MIT License](LICENSE).
