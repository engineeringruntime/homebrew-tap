class EngineeringRuntime < Formula
  desc "Governed execution runtime for engineering operations"
  homepage "https://engineeringruntime.com/"

  on_macos do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.7/engineering-runtime-v0.9.7-darwin-arm64.tar.gz?version=0.9.7"
      sha256 "94fa4d4f896ef15aaf357a423105706d854ef78cfed22900cf7154f2365b9338"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.7/engineering-runtime-v0.9.7-darwin-amd64.tar.gz?version=0.9.7"
      sha256 "33dfba5998797445987b03d22519024e6295b49775043e348a33c009ff47e864"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.7/engineering-runtime-v0.9.7-linux-arm64.tar.gz?version=0.9.7"
      sha256 "7da313f74aa5cb11fb55e68700298e4cef5c595ad619f8fa5e2a540dfd43a9ef"
    end

    on_intel do
      url "https://github.com/engineeringruntime/engineering-runtime-releases/releases/download/v0.9.7/engineering-runtime-v0.9.7-linux-amd64.tar.gz?version=0.9.7"
      sha256 "de7eda2cb988efe3208366b0002bd7b4358ac9682e9261ebc7386e6ffaaf3fe1"
    end
  end

  def install
    bin.install "runtime"
  end

  test do
    assert_match "runtime #{version}", shell_output("#{bin}/runtime version")
  end
end
