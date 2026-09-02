class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.0/engineering-runtime-v0.9.0-darwin-arm64.tar.gz?version=0.9.0"
      sha256 "d4975e2996fb4051b7488e51aa9e8c707501f91f7d266a0596e1d5bd434a11e1"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.0/engineering-runtime-v0.9.0-darwin-amd64.tar.gz?version=0.9.0"
      sha256 "bbbe5a219cc9e4dbb81111f068819a4b218dad8585b521c8dfeee882684f88b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.0/engineering-runtime-v0.9.0-linux-arm64.tar.gz?version=0.9.0"
      sha256 "2eef600cba1b0cbeaa2b2b6e002639135c43b98076515bb22a4773134a4ae3aa"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.0/engineering-runtime-v0.9.0-linux-amd64.tar.gz?version=0.9.0"
      sha256 "1092b93d86945eb4fc5896dfb1fe7cc572f8e0bc7a1e895b175d349de8f5cdbc"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
