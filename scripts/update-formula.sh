#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
  echo "usage: $0 <version> <SHA256SUMS.txt> [formula-path]" >&2
  exit 2
fi

version="${1#v}"
checksums="$2"
formula_path="${3:-Formula/engineering-runtime.rb}"

if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "invalid semantic version: $1" >&2
  exit 2
fi
if [ ! -f "$checksums" ]; then
  echo "checksum file not found: $checksums" >&2
  exit 2
fi

checksum_for() {
  local asset="$1"
  local checksum
  checksum="$(awk -v asset="$asset" '$2 == asset { print $1 }' "$checksums")"
  if ! [[ "$checksum" =~ ^[0-9a-f]{64}$ ]]; then
    echo "missing or invalid checksum for $asset" >&2
    exit 1
  fi
  printf '%s' "$checksum"
}

darwin_arm64="$(checksum_for "engineering-runtime-v${version}-darwin-arm64.tar.gz")"
darwin_amd64="$(checksum_for "engineering-runtime-v${version}-darwin-amd64.tar.gz")"
linux_arm64="$(checksum_for "engineering-runtime-v${version}-linux-arm64.tar.gz")"
linux_amd64="$(checksum_for "engineering-runtime-v${version}-linux-amd64.tar.gz")"

mkdir -p "$(dirname "$formula_path")"
cat >"$formula_path" <<EOF
class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v${version}/engineering-runtime-v${version}-darwin-arm64.tar.gz"
      sha256 "${darwin_arm64}"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v${version}/engineering-runtime-v${version}-darwin-amd64.tar.gz"
      sha256 "${darwin_amd64}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v${version}/engineering-runtime-v${version}-linux-arm64.tar.gz"
      sha256 "${linux_arm64}"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v${version}/engineering-runtime-v${version}-linux-amd64.tar.gz"
      sha256 "${linux_amd64}"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
EOF

ruby -c "$formula_path" >/dev/null
echo "updated $formula_path to v$version"
