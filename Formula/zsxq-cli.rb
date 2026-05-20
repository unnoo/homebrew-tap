class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.6/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "dc9f4e4f7627c20e2f24cb2b08e7ff7693591875113781145f7191434edaab9c"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.6/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "1fd858d9ea64eb214b8449cb4602099d4747b0efc3f0577003ca14d876bf09dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.6/zsxq-cli_linux_arm64.tar.gz"
      sha256 "3180a588067c13ed85181319f7a0c4a0db2d3c4de7ed4b7cf3d8b7b82339fb8e"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.6/zsxq-cli_linux_amd64.tar.gz"
      sha256 "d3d1a82ed367c508bddb78031a9937c10041d086c52ff644a96466276528f9cd"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
