class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.1/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "e969d908426b02786edb6edc5eda23ec35e44aac258888cb3e4ee08535e89968"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.1/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "81fadc135b6b328040623d203734b5d7ea21bc712e5da64e7bbfc1eb1a57e6ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.1/zsxq-cli_linux_arm64.tar.gz"
      sha256 "90ab4eb69d26d825a0c090fb86813f85b35dd66540983090dbf3a701ee805950"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.1/zsxq-cli_linux_amd64.tar.gz"
      sha256 "c15309c86a609204aafd4b40cc6c495e8e0791224cb0ddd2162e73a45ba37d15"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
