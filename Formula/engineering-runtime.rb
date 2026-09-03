class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.2/engineering-runtime-v0.9.2-darwin-arm64.tar.gz?version=0.9.2"
      sha256 "1adee352c80ff081b07484a01cb60c52b1799119b2e39f602853715f86f83099"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.2/engineering-runtime-v0.9.2-darwin-amd64.tar.gz?version=0.9.2"
      sha256 "7c74b03420c854679773172caf48086b30fc5b3b9cfe8be73d949469f5c8d3d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.2/engineering-runtime-v0.9.2-linux-arm64.tar.gz?version=0.9.2"
      sha256 "59673baf9bf34393cef6882de3232a9a35ae792e297eb4c68d2b941e96981470"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.2/engineering-runtime-v0.9.2-linux-amd64.tar.gz?version=0.9.2"
      sha256 "6bc38750812fd24982df27372a2ca15f18a39075f1ea340aba786fb99b57bcfa"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
