class ZsxqCli < Formula
  desc "Knowledge community (知识星球) CLI"
  homepage "https://github.com/unnoo/zsxq-cli"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.8/zsxq-cli_darwin_arm64.tar.gz"
      sha256 "25180105a371387d30c8d005e5dac271624c173c05433b8077acfb1c89320260"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.8/zsxq-cli_darwin_amd64.tar.gz"
      sha256 "b1bcb4d1b023264661470d01a20b1a58ca72712e68c0a7e38b91d8a978f1f629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.8/zsxq-cli_linux_arm64.tar.gz"
      sha256 "d7246d7214a8d7a7b5188ca2ceaf0fa8f088dc3bcd53a921ddfe81cba3d9bb8c"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/v0.4.8/zsxq-cli_linux_amd64.tar.gz"
      sha256 "795c54553c02391a2aa57f708ee34553fd3c0d3bd58aeeca6b2f4604bc3ccc6c"
    end
  end

  def install
    bin.install "zsxq-cli"
  end

  test do
    system "#{bin}/zsxq-cli", "--version"
  end
end
