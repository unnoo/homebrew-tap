# Generated from packaged SHA256SUMS; source commit 59dbb936934538a4402e29984d1be98bfe4de305.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridgeDev < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.9-dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.9-dev/zsxq-bridge_v0.1.9-dev_darwin_arm64.tar.gz"
      sha256 "312fbed6f34df68cf1d0b03a819671f672e686c1889fff4e45164beca3318755"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.9-dev/zsxq-bridge_v0.1.9-dev_darwin_amd64.tar.gz"
      sha256 "99eb039bb085b206697144aa9204efae01f845c511b801f6a9dd946beaea0b8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.9-dev/zsxq-bridge_v0.1.9-dev_linux_arm64.tar.gz"
      sha256 "df879b0c3bcf860339a846b9672742a2f8f99ca49977f9f14cf484e38e19117f"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.9-dev/zsxq-bridge_v0.1.9-dev_linux_amd64.tar.gz"
      sha256 "ba2a451eb80ed0da3fe83ed13a64a3e23728ea744c63cc20ab1829e40c13aba7"
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
    assert_equal "59dbb936934538a4402e29984d1be98bfe4de305", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge-dev --help")
    system bin/"zsxq-bridge-dev", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge-dev", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
