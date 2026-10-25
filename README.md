# infrafile Homebrew tap

Homebrew formula for [infrafile](https://github.com/infrafile/infrafile), a Git-backed infrastructure ledger with credential references, multi-cloud inventory, controlled plans and a read-only MCP interface.

```sh
brew install infrafile/tap/infrafile
infrafile version
ifl version
brew test infrafile/tap/infrafile
```

The formula installs `infrafile`, the `ifl` symlink, and the example ledger and documentation under `$(brew --prefix infrafile)/share/infrafile`. Supported platforms are macOS and Linux, on amd64 or arm64.

See the [quickstart](https://github.com/infrafile/infrafile/blob/main/docs/quickstart.md) for an offline walkthrough with fictional data. Release archives and the formula are signed using GitHub Actions OIDC and Cosign; verification and update instructions are in the [release guide](https://github.com/infrafile/infrafile/blob/main/docs/release.md).

Maintainers copy the verified `infrafile.rb` release asset into `Formula/infrafile.rb`, review its URLs and checksums, and commit with DCO sign-off (`git commit -s`). This repository contains no credentials.
