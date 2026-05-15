class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.3/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "906ff6d86e6bb31df4e46d91efba18c8bfc7508639e87117a5cc29dc0ffac9ab"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.3/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "ad097d3f7904241d7c8118ab3d5816c2b8da9569ca54edd412f05775e100641f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.3/zsxq-cli_linux_arm64.tar.gz"
      sha256 "8ef7e910ed741eb1aa8d4fc73ec30ff85887815bbe84b4378ac4783bd7aa0f12"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.3/zsxq-cli_linux_amd64.tar.gz"
      sha256 "d8ff63f5288df8f905186cbd5b9d3c40d9f23531300466664e9ffee7302724a3"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
