class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/zsxq-cli/releases/download/v0.4.2/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "1d4c80465a31d81f6860677682d51e807888b7f82a1bbcd3fc473343622b647f"
    end
    on_intel do
      url "https://github.com/unnoo/zsxq-cli/releases/download/v0.4.2/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "c91f436f181ca846dfcb73678ce48fd8a0c915ab1403b20ea7096c6c6e397949"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/zsxq-cli/releases/download/v0.4.2/zsxq-cli_linux_arm64.tar.gz"
      sha256 "5df58accadca3eafba7cddf06640c2ea66e3123ddbfd9a4a22cbebd1f80b2786"
    end
    on_intel do
      url "https://github.com/unnoo/zsxq-cli/releases/download/v0.4.2/zsxq-cli_linux_amd64.tar.gz"
      sha256 "1ca8cf40366a1c3ea388b6ba4f696f6522e491218f504def14ba2b5d131ab1b9"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
