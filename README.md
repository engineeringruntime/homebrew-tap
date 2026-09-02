# Engineering Runtime Homebrew tap

Official Homebrew distribution for
[Engineering Runtime](https://engineeringruntime.com/).

## Install

```bash
brew install engineeringruntime/tap/engineering-runtime
runtime version
```

The formula supports Homebrew on macOS and Linux, on arm64 and amd64. It downloads
the same public, versioned archives used by the checksum-verifying
[`install.sh`](https://github.com/engineeringruntime/engineering-runtime-releases/blob/main/install.sh)
path.

## Upgrade

```bash
brew update
brew upgrade engineering-runtime
```

## Uninstall

```bash
brew uninstall engineering-runtime
```

Uninstalling removes the Homebrew-managed binary only. It deliberately leaves
`~/.engineering-runtime` intact because that directory contains user- and
company-owned configuration, policy, capabilities, and audit state.

## Maintainer checks

```bash
brew audit --strict --online engineeringruntime/tap/engineering-runtime
brew style --formula engineeringruntime/tap/engineering-runtime
brew test engineeringruntime/tap/engineering-runtime
```

Release archives and checksums are published in
[`engineeringruntime/engineering-runtime-releases`](https://github.com/engineeringruntime/engineering-runtime-releases).
The Runtime release process dispatches the tap's updater after publishing a
release. A maintainer can also run **Update from latest Runtime release**
manually from GitHub Actions. There is no scheduled polling job. Drafts and
prereleases are not returned by the Latest Release API and cannot update the
formula.
