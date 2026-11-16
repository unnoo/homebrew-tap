# Generated from packaged SHA256SUMS; source commit e63a4b0e5c70707147e5d0efba0c5c195007610a.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridgeDev < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.8-dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.8-dev/zsxq-bridge_v0.1.8-dev_darwin_arm64.tar.gz"
      sha256 "70ce8a49b4494a6b2a323c90c1dcb43afe876d1b0f4dc7dd73c474c4cfe5e8d2"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.8-dev/zsxq-bridge_v0.1.8-dev_darwin_amd64.tar.gz"
      sha256 "a31ddf5aaaf1b2edb62911e687f796fbbafd4b348b5827ed5d56e015ecd658bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.8-dev/zsxq-bridge_v0.1.8-dev_linux_arm64.tar.gz"
      sha256 "8a9a6ba0a21229a6e971f4a1e31e20252e912087e8866f700c948d8b7cbcdaeb"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.8-dev/zsxq-bridge_v0.1.8-dev_linux_amd64.tar.gz"
      sha256 "c55409e0c06e092594e4e38bfee0dc4963ce7b1bb300b9accbb4a53f38619e86"
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
    assert_equal "e63a4b0e5c70707147e5d0efba0c5c195007610a", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge-dev --help")
    system bin/"zsxq-bridge-dev", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge-dev", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
