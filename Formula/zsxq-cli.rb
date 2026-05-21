class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.7/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "c89c8d4b9e0ac9579cc52d96031882759a8e05bc1716e3badec30435ee201c15"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.7/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "d8da8b1be434c04b2d1cb026c1bc1ba75ca7d5b2d1766f62140b3fd263edf7e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.7/zsxq-cli_linux_arm64.tar.gz"
      sha256 "63ae281ae651575034479621c58ecddcfef3c37c70b7f0291ba49f2ee31805e3"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.7/zsxq-cli_linux_amd64.tar.gz"
      sha256 "914ae0ff640b82c5cd3908ad3d17b0b01ff8be1355170bfd65e44d4af6dd5940"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
