class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.9/engineering-runtime-v0.9.9-darwin-arm64.tar.gz?version=0.9.9"
      sha256 "3f18ad63ed8525bc5db4bda8055d9300a19836d641dea02750dc6b749aa9c6dc"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.9/engineering-runtime-v0.9.9-darwin-amd64.tar.gz?version=0.9.9"
      sha256 "7089e0a3f76554812a4e8d84e324609517cc92a5dd28c744b84120fcb3240273"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.9/engineering-runtime-v0.9.9-linux-arm64.tar.gz?version=0.9.9"
      sha256 "068fbf8b5507103c1f8e14288d7de356857c005fd9862aaf568cbe151ce60868"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.9/engineering-runtime-v0.9.9-linux-amd64.tar.gz?version=0.9.9"
      sha256 "dd61e176d7695e90f870e1c1a183fa943a7331038dc2abd6ab88c7817c11a0c4"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
