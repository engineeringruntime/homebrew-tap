class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.6/engineering-runtime-v0.9.6-darwin-arm64.tar.gz?version=0.9.6"
      sha256 "2e2ebd8f44e1099504734fbd9d1a8827471df310af3f61d59877ffe102d3f8dc"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.6/engineering-runtime-v0.9.6-darwin-amd64.tar.gz?version=0.9.6"
      sha256 "e1577a88f0c0763449408733fe3f38ea829c1b541a2053bcf503ec3a617d0c15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.6/engineering-runtime-v0.9.6-linux-arm64.tar.gz?version=0.9.6"
      sha256 "c03ebf0c102c6d3bbde5187042ce9e3e6016521f2d7a1faf6169bce241eb6468"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.6/engineering-runtime-v0.9.6-linux-amd64.tar.gz?version=0.9.6"
      sha256 "4c9780e169e96f9f6a6719eaaa49ce6628fd0af270979e355e4361fbbf477d62"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
