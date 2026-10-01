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

## Current state (2026-09-25)

- The committed formula installs **v0.9.9**, which ships the `runtime`
  executable.
- v0.10.0 renames the executable to `engrt` and archives to
  `engrt-<version>-<os>-<arch>.tar.gz` (Runtime ADR-008). The generator, updater
  and CI changes for that are in homebrew-tap PR #4, which must merge before
  v0.10.0 is published; the updater then regenerates the formula. The formula
  name stays `engineering-runtime`.
