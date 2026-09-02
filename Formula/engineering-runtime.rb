class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.8.0/engineering-runtime-v0.8.0-darwin-arm64.tar.gz"
      sha256 "23e2b9e80a7e68e0015c93bf1589c7c5973c761f8aa5bef0e12c49ca91deac70"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.8.0/engineering-runtime-v0.8.0-darwin-amd64.tar.gz"
      sha256 "b584a7fa9ef93e608506e6ceed4bfa705025dcb61e00598816f839fd83469626"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.8.0/engineering-runtime-v0.8.0-linux-arm64.tar.gz"
      sha256 "ac34771cede15d1b71e8541e181f20de643cfe86030070d0e799ebfa9024c5f8"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.8.0/engineering-runtime-v0.8.0-linux-amd64.tar.gz"
      sha256 "c7b3dbd993cf7195bd1715bfe3dab198957e01238e62bd7e1739a42ff9a3e6b9"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
