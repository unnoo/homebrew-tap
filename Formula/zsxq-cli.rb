class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.4/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "840ff3f4fc2e6e45ff8d1c117a10965314458f989d88b72b21a0cadbc7ab8f0e"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.4/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "6a9c15bc19e2e29ebf67ba6f23ed098aa3dc56b4330ac509ff63439d2ead6817"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.4/zsxq-cli_linux_arm64.tar.gz"
      sha256 "5f73f6bdba5c5ad4077e5970a5a7987cb38b793b178f4a22c946d9f48e008032"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.4/zsxq-cli_linux_amd64.tar.gz"
      sha256 "d53897e1d11ff2dd8e3f8e1abb2dc0241f9ec45ff7fae6a26106a4f36f63c814"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
