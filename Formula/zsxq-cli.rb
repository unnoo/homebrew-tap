class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.9/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "df2409d3fcd75b0bf045238493f643fa598fc764396d7249dfe305bd69fb9772"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.9/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "afcacf69d4f2392127c23973d54f400bb46e6311ca10ad933bc271bcf532a007"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.9/zsxq-cli_linux_arm64.tar.gz"
      sha256 "5aca85ba3e9d1bea328a3db9f1b619b29c4465cf3ee1a8e604bd9fe58051b94d"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.9/zsxq-cli_linux_amd64.tar.gz"
      sha256 "b9cb7a618ed7bedc1d10c84c5ac286d4e3a4a6397f906f671ab7ec354b61f6bf"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
