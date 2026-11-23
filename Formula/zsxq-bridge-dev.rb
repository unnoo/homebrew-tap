# Generated from packaged SHA256SUMS; source commit 69f4b8563fcf93ec7dcb1ab3fd92d70e56bd88b2.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridgeDev < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.11-dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.11-dev/zsxq-bridge_v0.1.11-dev_darwin_arm64.tar.gz"
      sha256 "0fa17089259372b30cf1a8a930106a6c6fedaf748cf8f5a0bc317b5bc91ca6e9"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.11-dev/zsxq-bridge_v0.1.11-dev_darwin_amd64.tar.gz"
      sha256 "f23b5463dbc5d19157e4d7432be673748098bcc410edb64c66b9fc3056e876d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.11-dev/zsxq-bridge_v0.1.11-dev_linux_arm64.tar.gz"
      sha256 "5813719c73d1c7b92fc11daa68737cdad55bd7dfb23c1e7be7132f82f4e5f4c1"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.11-dev/zsxq-bridge_v0.1.11-dev_linux_amd64.tar.gz"
      sha256 "9c072968fe4b4d4776a00b046d40c82026d64bb96f8cf7756926eb72aa8b975c"
    end
  end

  def install
    bin.install "zsxq-bridge" => "zsxq-bridge-dev"
  end

  test do
    require "json"
    ENV["AGENT_BRIDGE_CONFIG"] = (testpath/"config.json").to_s
    ENV["HOME"] = testpath.to_s
    ENV["XDG_CONFIG_HOME"] = (testpath/"config").to_s
    info = JSON.parse(shell_output("#{bin}/zsxq-bridge-dev version --json"))
    assert_equal "v#{version}", info.fetch("version")
    assert_equal "test", info.fetch("environment")
    assert_equal "69f4b8563fcf93ec7dcb1ab3fd92d70e56bd88b2", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge-dev --help")
    system bin/"zsxq-bridge-dev", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge-dev", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
