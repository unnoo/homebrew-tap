# Generated from packaged SHA256SUMS; source commit 505982de30ccd992ebfa34f04696cbcb6cbfbcf1.
# The project owner selected Apache-2.0; LICENSE is included in release packages.
class ZsxqBridgeDev < Formula
  desc "Local capability bridge for ZSXQ agents"
  homepage "https://github.com/unnoo/homebrew-tap"
  version "0.1.7-dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.7-dev/zsxq-bridge_v0.1.7-dev_darwin_arm64.tar.gz"
      sha256 "3fab138aaefecd681295f1b8a16ae997b28b8ea5cdc5754cfbb2de61245a6676"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.7-dev/zsxq-bridge_v0.1.7-dev_darwin_amd64.tar.gz"
      sha256 "83f87d0f0e82a5277596450d930eae1ecd6d7af9bdcda8f61a5042bc31a34594"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.7-dev/zsxq-bridge_v0.1.7-dev_linux_arm64.tar.gz"
      sha256 "2757a4a3fb9143f59cb5e187e39389954ebae70a4b73a8423eb5e13b8c93354f"
    end
    on_intel do
      url "https://github.com/unnoo/homebrew-tap/releases/download/zsxq-bridge-v0.1.7-dev/zsxq-bridge_v0.1.7-dev_linux_amd64.tar.gz"
      sha256 "ff7ab7f02dce17bd18c7ec1d96467007bc8ed9b61a0ee96d024a5fe765e39222"
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
    assert_equal "505982de30ccd992ebfa34f04696cbcb6cbfbcf1", info.fetch("commit")
    assert_equal false, info.fetch("dirty")
    assert_equal "git", info.fetch("provenance")
    assert_match "zsxq-bridge", shell_output("#{bin}/zsxq-bridge-dev --help")
    system bin/"zsxq-bridge-dev", "init", "--data-dir", testpath/"data"
    system bin/"zsxq-bridge-dev", "config", "validate"
    assert_path_exists testpath/"config.json"
  end
end
