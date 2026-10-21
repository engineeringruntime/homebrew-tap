class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.13.0/engrt-v0.13.0-darwin-arm64.tar.gz?version=0.13.0"
      sha256 "7cc806b77b66915584f38bad1b578acf1321339228c871ffa28f7d4c8843649b"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.13.0/engrt-v0.13.0-darwin-amd64.tar.gz?version=0.13.0"
      sha256 "0f4215ed4699a83f3aad4463d21836ff9acad36baf587b088b4d9f9c3e663dc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.13.0/engrt-v0.13.0-linux-arm64.tar.gz?version=0.13.0"
      sha256 "070be85580d3c7f7860a62913dac71928c965958a3cb07e949afd132e9200e5a"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.13.0/engrt-v0.13.0-linux-amd64.tar.gz?version=0.13.0"
      sha256 "38dc2f8315f20f8a6cce3cede9ac30514df9c878c93fd833c68e62d563756ec0"
    end
  end

  def install
    bin.install "engrt"
  end

  def caveats
    <<~EOS
      The command is engrt and its Runtime Home is ~/.engrt (from v0.10.0).
      An earlier ~/.engineering-runtime is not read; copy it to ~/.engrt
      before the first engrt command to keep its audit history.
    EOS
  end

  test do
    assert_match "engrt #{version}", shell_output("#{bin}/engrt version")
  end
end
