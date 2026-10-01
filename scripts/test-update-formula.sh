#!/usr/bin/env bash
# Offline fixtures for update-formula.sh. No network, release or tap change.
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

sums="$tmp/SHA256SUMS.txt"
: >"$sums"
for platform in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
  printf '%s  engrt-v0.10.0-%s.tar.gz\n' "$(printf '%s' "$platform" | sha256sum | cut -d' ' -f1)" "$platform" >>"$sums"
done

formula="$tmp/Formula/engineering-runtime.rb"
"$repo_dir/scripts/update-formula.sh" v0.10.0 "$sums" "$formula" >/dev/null
ruby -c "$formula" >/dev/null
grep -Fqx '    bin.install "engrt"' "$formula"
grep -Fq 'assert_match "engrt #{version}", shell_output("#{bin}/engrt version")' "$formula"
if grep -Eq 'engineering-runtime-v|bin/runtime|install "runtime"' "$formula"; then
  echo "FAIL generated formula still names the pre-0.10.0 layout" >&2
  exit 1
fi
# Each platform's URL carries that platform's own checksum.
for platform in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
  want="$(printf '%s' "$platform" | sha256sum | cut -d' ' -f1)"
  grep -A1 "/v0.10.0/engrt-v0.10.0-${platform}.tar.gz?version=0.10.0\"" "$formula" | grep -Fq "sha256 \"$want\"" || {
    echo "FAIL $platform URL/checksum pairing" >&2
    exit 1
  }
done

refuse() {
  local name="$1" message="$2"; shift 2
  local out
  if out="$("$repo_dir/scripts/update-formula.sh" "$@" 2>&1)"; then
    echo "FAIL $name: generator accepted it" >&2
    exit 1
  fi
  grep -Fq -- "$message" <<<"$out" || { echo "FAIL $name: $out" >&2; exit 1; }
}
refuse pre-engrt "predates the engrt executable" v0.9.9 "$sums" "$tmp/old.rb"
refuse prerelease "invalid semantic version" v0.10.0-rc.1 "$sums" "$tmp/rc.rb"
grep -v linux-arm64 "$sums" >"$tmp/partial.txt"
refuse missing-platform "missing or invalid checksum for engrt-v0.10.0-linux-arm64.tar.gz" v0.10.0 "$tmp/partial.txt" "$tmp/partial.rb"
sed 's/engrt-v0.10.0/engineering-runtime-v0.10.0/' "$sums" >"$tmp/old-names.txt"
refuse old-archive-names "missing or invalid checksum" v0.10.0 "$tmp/old-names.txt" "$tmp/old-names.rb"
test ! -e "$tmp/old.rb" && test ! -e "$tmp/partial.rb"

echo "Formula generator fixtures: PASS (engrt layout, per-platform checksums, pre-engrt/prerelease/missing/old-name refusals)"
