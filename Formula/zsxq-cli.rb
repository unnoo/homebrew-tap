class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.0/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "8c92b99ea480628540c8049c17a0151994483f44986aa1ae2493ba841682b8cd"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.0/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "1b0eccd4ddae064aa708f70dc9f5a50284f671df1fb95124f48488f6a1a05086"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.0/zsxq-cli_linux_arm64.tar.gz"
      sha256 "a6197689a2030dcad27688238797c35da09bbca0b01e87ba281795d5d1693059"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.5.0/zsxq-cli_linux_amd64.tar.gz"
      sha256 "d091f7953f8a38671ebb8c8f9275540e8a5bc4fae45d08e6f3fd7a2ff8a234b2"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
