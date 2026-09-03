class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.4/engineering-runtime-v0.9.4-darwin-arm64.tar.gz?version=0.9.4"
      sha256 "03d4255afeb9f841a8c72de7a07453f8f3cb8df8a74e9491751051fd263fbd76"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.4/engineering-runtime-v0.9.4-darwin-amd64.tar.gz?version=0.9.4"
      sha256 "4b39099d6c1749ceaf89c87535c373587e80dd757946bf520ef13fe4276d9725"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.4/engineering-runtime-v0.9.4-linux-arm64.tar.gz?version=0.9.4"
      sha256 "ca45e7dd4853e4f8e03099dba84a80208230370652eb0713885f4e5f4bde234a"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.4/engineering-runtime-v0.9.4-linux-amd64.tar.gz?version=0.9.4"
      sha256 "1dfce3a2721506582f66a594178ffa24298e40a9adfd7e0f6559d8f2c1b43e10"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
