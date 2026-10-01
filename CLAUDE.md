# CLAUDE.md — homebrew-tap

Homebrew distribution for Engineering Runtime:
`brew install engineeringruntime/tap/engineering-runtime`. The formula
downloads the published release archives from
`engineeringruntime/engineering-runtime-releases` and verifies their SHA-256.
This repository never builds Runtime and never hosts binaries.

## Layout

| Path | Role |
|---|---|
| `Formula/engineering-runtime.rb` | The formula. **Generated — do not hand-edit** |
| `scripts/update-formula.sh` | Writes the formula from a version and that release's `SHA256SUMS.txt` |
| `.github/workflows/update.yml` | Manual: resolves the latest non-draft, non-prerelease release, checks all four assets exist, regenerates and commits the formula. Dispatched by the Runtime release process |
| `.github/workflows/ci.yml` | On PR/push: `brew audit --strict --online`, `brew style`, install, version check, `config validate` in a throwaway Home, `brew test`, uninstall on macOS arm64/Intel and Linux arm64/amd64 |

## Rules

- Change the formula only by regenerating it from a **published** release's
  checksums. Drafts and prereleases never update it.
- Supported: macOS and Linux on arm64 and amd64. Windows is not supported.
- Uninstall must leave the user's Runtime Home in place.
- Releasing and dispatching the updater are owner-authorized steps.

## Current state (2026-10-01)

The owner authorized merging PR #4 after private v0.10.0 publication.
The formula installs `engrt` from the actual published v0.10.0 archives and
checksums; generator, updater and CI use the engrt layout. Formula name remains
`engineering-runtime`. Repository visibility is unchanged. Anonymous downloads
and native Homebrew installation/upgrade/uninstall verification remain pending
public artifact access; do not claim those gates passed. Runtime supports
Windows through its separate PowerShell installer/ZIP path, not this tap.
