class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.8/engineering-runtime-v0.9.8-darwin-arm64.tar.gz?version=0.9.8"
      sha256 "b4181d9fa9254b0d85b5858ad3f0b3430356a8ede8c362874ff5602548b753cd"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.8/engineering-runtime-v0.9.8-darwin-amd64.tar.gz?version=0.9.8"
      sha256 "3c26f8685785971b6f639be5448be68a18a20b47f09bbe0d289de635fed46c5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.8/engineering-runtime-v0.9.8-linux-arm64.tar.gz?version=0.9.8"
      sha256 "0c85fd21eec86e8c3b6bded521c934d70ed207a4f075c2fc6b6c0d11e8bddf1f"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.8/engineering-runtime-v0.9.8-linux-amd64.tar.gz?version=0.9.8"
      sha256 "44fe45e2028d3cb646694ae6b4c7553b9a616ea0b29b576c49454d84b9b78f9b"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
