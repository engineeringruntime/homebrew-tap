class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.1/engineering-runtime-v0.9.1-darwin-arm64.tar.gz?version=0.9.1"
      sha256 "4a2751526167f8753208faa5fab1c8a0915c284afe51e0b8e532da136e17ba10"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.1/engineering-runtime-v0.9.1-darwin-amd64.tar.gz?version=0.9.1"
      sha256 "e00cc568e58e417a8d03eaa34b2a1dc8fd9f7d09c8e4620bf29798ba2b64771e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.1/engineering-runtime-v0.9.1-linux-arm64.tar.gz?version=0.9.1"
      sha256 "a52ef169b8c9f00d403c9e60aa5c31238439b516d9554840e2fef4d550f3e4c6"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.1/engineering-runtime-v0.9.1-linux-amd64.tar.gz?version=0.9.1"
      sha256 "dc9491efe761914987801341a49dd76019e78c539913d665e473976f8a1a09f8"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
