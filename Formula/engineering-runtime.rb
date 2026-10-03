class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.11.0/engrt-v0.11.0-darwin-arm64.tar.gz?version=0.11.0"
      sha256 "c71d722b4ba3149167dec2233b174189e8e2f1d47a0f984e68b31b0eff7c0200"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.11.0/engrt-v0.11.0-darwin-amd64.tar.gz?version=0.11.0"
      sha256 "9bf7222a3171d4c947d31baed7ac4a07162e60e748718aa8baae79dacd58c89b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.11.0/engrt-v0.11.0-linux-arm64.tar.gz?version=0.11.0"
      sha256 "277dec532bd11f00840649f53999b2e79df4b338fe286e37c8248ea5a0a3c5b4"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.11.0/engrt-v0.11.0-linux-amd64.tar.gz?version=0.11.0"
      sha256 "f5be2fa0bb6bb0e9aecd8b9079049c3857106c9743b804d8df0be443a9fd5332"
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
