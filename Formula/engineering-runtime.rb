class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.3/engineering-runtime-v0.9.3-darwin-arm64.tar.gz?version=0.9.3"
      sha256 "94a0f904be4335c7ee37f3f4b725adf32a945565b82d72980e2fb0a1c29ab7cd"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.3/engineering-runtime-v0.9.3-darwin-amd64.tar.gz?version=0.9.3"
      sha256 "de58e9680ac701b579fe83699c548a4d09ae387355b5517c813ee339407bb468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.3/engineering-runtime-v0.9.3-linux-arm64.tar.gz?version=0.9.3"
      sha256 "309ea58daf6b9d89540da564aab76ffce697b43ec8d032edbbf9497e2653cda3"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.3/engineering-runtime-v0.9.3-linux-amd64.tar.gz?version=0.9.3"
      sha256 "195f4cb344a3a9f2a3cc148c7d19be0e540f6220a1e77d7570fd6c0b12255918"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
