class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.5/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "a4ef4cdea03078f830fbcab1c1519bfc5be43f8c6632560566ce5115f1381853"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.5/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "981bda64d60672c1db4546d1e7ab6ed7e63f1bbc4312d8dc7e4a05184c17918f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.5/zsxq-cli_linux_arm64.tar.gz"
      sha256 "803c5c9e0202170fb5dd495e89afeff7e00a0de6def96a457a3a1486e5695cb7"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.5/zsxq-cli_linux_amd64.tar.gz"
      sha256 "501550fdee5cf7771152b65dbeb9f1d0c1a5e669b1fde55de69f0f3d33a009d1"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
