# Generated from packaged SHA256SUMS; source commit dc6e0cf8a9f3b72e8bc5fc1d4aef66ffaca5144e.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridge < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.10/zsxq-bridge_v0.1.10_darwin_arm64.tar.gz"
      sha256 "6a6a49b01be81f84e9d5b32237556889cf5ba1e3247d30fe193f17cfc60a9c6f"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.10/zsxq-bridge_v0.1.10_darwin_amd64.tar.gz"
      sha256 "01376b1a1a1702ec886d15a3157bc3d5851d4232383ac7baadc11d908f7ba00e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.10/zsxq-bridge_v0.1.10_linux_arm64.tar.gz"
      sha256 "0602f39a809baf38d49d6053e1f0a2ba6472959744bec4c7078a5f4e5a37f98f"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.10/zsxq-bridge_v0.1.10_linux_amd64.tar.gz"
      sha256 "4c6747d9c5c9673969e730c567ccf23c9fb4237888d93ffe7970a10b4f582fa4"
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
    assert_equal "dc6e0cf8a9f3b72e8bc5fc1d4aef66ffaca5144e", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge --help")
    system bin/"zsxq-bridge", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
