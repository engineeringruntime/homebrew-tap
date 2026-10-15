class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.12.0/engrt-v0.12.0-darwin-arm64.tar.gz?version=0.12.0"
      sha256 "05d8e4b1f21d4d93c0be30a6e750792365678311063c42d3a87686bef0734c79"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.12.0/engrt-v0.12.0-darwin-amd64.tar.gz?version=0.12.0"
      sha256 "fcdb74fd73bdba48e5c2cd16b7a963462fc9dd86f14c90459a99e8668a3f83a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.12.0/engrt-v0.12.0-linux-arm64.tar.gz?version=0.12.0"
      sha256 "674f8d3d9dff0a320b4898be5abe94ce7ab55dd37eb5fff99a18cd6428cf432b"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.12.0/engrt-v0.12.0-linux-amd64.tar.gz?version=0.12.0"
      sha256 "6b0e9fe2363281e78fedb1a91845be90b9fc97e79d98c761d19f4bf7e43e8021"
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
