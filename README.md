# Engineering Runtime Homebrew tap

Official Homebrew distribution for
[Engineering Runtime](https://engineeringruntime.com/).

## Install

The v0.10.0 formula is prepared on main. Standard Homebrew downloads require
public access to this tap and the release assets; that access remains
owner-controlled. End-to-end Homebrew installation is not yet verified.

Engineering Runtime supports macOS and Linux on arm64 and amd64.
Windows uses the [PowerShell installer or ZIP installation](https://docs.engineeringruntime.com/get-started/installation/#v0100-windows-candidate-preparation), rather than Homebrew.

```bash
brew install engineeringruntime/tap/engineering-runtime
engrt version
```

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
brew upgrade engineering-runtime
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
brew uninstall engineering-runtime
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
