# Engineering Runtime Homebrew tap

[![Homebrew tap](https://github.com/engineeringruntime/homebrew-tap/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/engineeringruntime/homebrew-tap/actions/workflows/ci.yml)
[![engrt release](https://img.shields.io/github/v/release/engineeringruntime/engineering-runtime-releases?label=engrt)](https://github.com/engineeringruntime/engineering-runtime-releases/releases/latest)

Official Homebrew distribution for
[Engineering Runtime](https://engineeringruntime.com/).

## Install

The formula installs the latest Engineering Runtime release from the public
[releases repository](https://github.com/engineeringruntime/engineering-runtime-releases)
and checks each archive against that release's SHA-256 checksums. This tap's CI
installs, runs, tests and uninstalls it on macOS (Apple silicon and Intel) and
Linux (arm64 and amd64).

Windows is not supported by Homebrew; use the
[PowerShell installer or ZIP](https://github.com/engineeringruntime/engineering-runtime-releases#windows-powershell-7-x64-or-arm64).
To run your first capability after installing, follow the
[capabilities quick start](https://github.com/engineeringruntime/engineering-runtime-capabilities#quick-start-from-install-to-your-first-run).

```bash
brew install engineeringruntime/tap/engineering-runtime
engrt version
```

Always use the full name, `engineeringruntime/tap/engineering-runtime`. Since Homebrew 7, formulae from
third-party taps load only once trusted; installing, upgrading or reinstalling
by the full name trusts this formula, while a short name such as
`brew upgrade engineering-runtime` is refused until then. To trust it
explicitly: `brew trust --formula engineeringruntime/tap/engineering-runtime`.

From v0.10.0 the formula installs the `engrt` command (earlier releases
installed `runtime`). The formula name stays `engineering-runtime`, the product
name.

The formula supports Homebrew on macOS and Linux, on arm64 and amd64. It downloads
the same versioned archives used by the checksum-verifying
[`install.sh`](https://github.com/engineeringruntime/engineering-runtime-releases/blob/main/install.sh)
path.

## Upgrade

```bash
brew update
brew upgrade engineeringruntime/tap/engineering-runtime
```

Upgrading from v0.9.x to v0.10.0 replaces the Homebrew-managed `runtime` with
`engrt`; update scripts and CI that call `runtime`. The new default Runtime Home
is `~/.engrt`, and `~/.engineering-runtime` is not read. To keep its audit
history, copy it before the first `engrt` command:

```bash
test ! -e ~/.engrt && cp -Rp ~/.engineering-runtime ~/.engrt
```

Runtime environment variables are renamed from `RUNTIME_*` to `ENGRT_*`; see
the [upgrade guide](https://docs.engineeringruntime.com/get-started/upgrading/).

## Uninstall

```bash
brew uninstall engineeringruntime/tap/engineering-runtime
```

Uninstalling removes the Homebrew-managed binary only. It deliberately leaves
the Runtime Home (`~/.engrt`, or `~/.engineering-runtime` before v0.10.0)
intact because that directory contains user- and company-owned configuration,
policy, capabilities, and audit state.

## Maintainer checks

```bash
brew audit --strict --online engineeringruntime/tap/engineering-runtime
brew style --formula engineeringruntime/tap/engineering-runtime
brew test engineeringruntime/tap/engineering-runtime
./scripts/test-update-formula.sh
```

Release archives and checksums are published in
[`engineeringruntime/engineering-runtime-releases`](https://github.com/engineeringruntime/engineering-runtime-releases).
The Runtime release process dispatches the tap's updater after publishing a
release. A maintainer can also run **Update from latest Runtime release**
manually from GitHub Actions. There is no scheduled polling job. Drafts and
prereleases are not returned by the Latest Release API and cannot update the
formula.

## Security and licence

Report security problems privately, as [SECURITY.md](SECURITY.md) describes.

This tap's formula and scripts are licensed under the [BSD 2-Clause License](LICENSE).
The Engineering Runtime binary it installs is proprietary software under its own
[binary licence](https://github.com/engineeringruntime/engineering-runtime-releases/blob/main/LICENSE).
