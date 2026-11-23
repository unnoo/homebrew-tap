# Generated from packaged SHA256SUMS; source commit 9a900aca03f44616075421ec125e8c0dede9a053.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridge < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.12/zsxq-bridge_v0.1.12_darwin_arm64.tar.gz"
      sha256 "22d66dea21c3894501c0617765899b0f346b00ba2959d0138f10a8158a9a903d"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.12/zsxq-bridge_v0.1.12_darwin_amd64.tar.gz"
      sha256 "919f0f8ca566fdd95622b8cb62b4dd3edc70531b75763df2db8c35627f585e12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.12/zsxq-bridge_v0.1.12_linux_arm64.tar.gz"
      sha256 "ce69f89543a8f6800ed44797db4b78d32960932811f18d1a7d3472d7dd7d600d"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.12/zsxq-bridge_v0.1.12_linux_amd64.tar.gz"
      sha256 "6d01a9c4d3c77f86483a67d4c24a9b3a28ce9ce3b731bd3957c9897fbe110973"
    end
  end

  def install
    bin.install "zsxq-bridge" => "zsxq-bridge"
  end

  test do
    require "json"
    ENV["AGENT_BRIDGE_CONFIG"] = (testpath/"config.json").to_s
    ENV["HOME"] = testpath.to_s
    ENV["XDG_CONFIG_HOME"] = (testpath/"config").to_s
    info = JSON.parse(shell_output("#{bin}/zsxq-bridge version --json"))
    assert_equal "v#{version}", info.fetch("version")
    assert_equal "production", info.fetch("environment")
    assert_equal "9a900aca03f44616075421ec125e8c0dede9a053", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge --help")
    system bin/"zsxq-bridge", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
