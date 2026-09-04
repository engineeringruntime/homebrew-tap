class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.5/engineering-runtime-v0.9.5-darwin-arm64.tar.gz?version=0.9.5"
      sha256 "225c6a67f52669d0a6e50a2d9dd1639f81404522c012f4bb9a375a8bbf12eff3"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.5/engineering-runtime-v0.9.5-darwin-amd64.tar.gz?version=0.9.5"
      sha256 "058ff77c0743e9cdaefe2ac1497bbb3179754c2b64079bdf75524112c9640e58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.5/engineering-runtime-v0.9.5-linux-arm64.tar.gz?version=0.9.5"
      sha256 "405c85bfd05061609f0d3a28d9ad3a9930d8ef2f508964790dc8db5234384a33"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.5/engineering-runtime-v0.9.5-linux-amd64.tar.gz?version=0.9.5"
      sha256 "4d0c8fe9bccacc569d121ab8fb8d33967cd48bb81853cbb986c0d21e81df1681"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
