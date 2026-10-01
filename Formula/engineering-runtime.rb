class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.10.0/engrt-v0.10.0-darwin-arm64.tar.gz?version=0.10.0"
      sha256 "063af7fe5904af3ffa70744a31e1b80cd49088fa484e65ceb6bf1f0f17a3ef8b"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.10.0/engrt-v0.10.0-darwin-amd64.tar.gz?version=0.10.0"
      sha256 "86df0fe85f7960380c98beb8f8de0f702e40498ad434736ef1be55e764e1f999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.10.0/engrt-v0.10.0-linux-arm64.tar.gz?version=0.10.0"
      sha256 "80b5cec4b30741e4f172963f72186b89f6957b28dfb32e27240947b6852122d1"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.10.0/engrt-v0.10.0-linux-amd64.tar.gz?version=0.10.0"
      sha256 "937c989c6a3c3eecb96083f61f5f53c09e5ea1bd0d140d7f0e34515d12c7593c"
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
