# Generated from packaged SHA256SUMS; source commit 9a45181580cb9ce30a0373b2dbc5df6b31d5261f.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridgeDev < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.6-dev"
  license "Apache-2.0"
  conflicts_with "zsxq-bridge", because: "both install the zsxq-bridge command"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.6-dev/zsxq-bridge_v0.1.6-dev_darwin_arm64.tar.gz"
      sha256 "d1dfd3e038290d404abb36b2789ea82d079e22634311d208959800ba9642e302"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.6-dev/zsxq-bridge_v0.1.6-dev_darwin_amd64.tar.gz"
      sha256 "82f03a070d008bc4f2adc1984d2e325157c5d079bb4fc16db357b2fdb2d372f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.6-dev/zsxq-bridge_v0.1.6-dev_linux_arm64.tar.gz"
      sha256 "87fdaf0804fed9d1c0d532cb2a1705d93e1d530ff8989bb3da8ebb03d1dbf1be"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.6-dev/zsxq-bridge_v0.1.6-dev_linux_amd64.tar.gz"
      sha256 "558a1dc5cbbb2322a00509163457ed6e426629045d91fbb0a5f6fb5ee9a780c3"
    end
  end

  def install
    bin.install "zsxq-bridge"
  end

  test do
    require "json"
    ENV["AGENT_BRIDGE_CONFIG"] = (testpath/"config.json").to_s
    ENV["HOME"] = testpath.to_s
    ENV["XDG_CONFIG_HOME"] = (testpath/"config").to_s
    info = JSON.parse(shell_output("#{bin}/zsxq-bridge version --json"))
    assert_equal "v#{version}", info.fetch("version")
    assert_equal "test", info.fetch("environment")
    assert_equal "9a45181580cb9ce30a0373b2dbc5df6b31d5261f", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge --help")
    system bin/"zsxq-bridge", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
