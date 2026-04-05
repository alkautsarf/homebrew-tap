class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.2.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.2.0/phosphor-v0.2.0-darwin-arm64.tar.gz"
      sha256 "258bbcd49d35679e752f52bdbbf669e01e0483b44900f7c87dcee77f549ba7aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.2.0/phosphor-v0.2.0-linux-x64.tar.gz"
      sha256 "ba0170f78fe3bc56de3de1e8edb93e7f7f5918eaa79103a2a484308e2827247b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"phosphor"
    bin.install_symlink bin/"phosphor" => "ph"
    bin.install_symlink bin/"phosphor" => "pho"
  end

  test do
    assert_predicate bin/"phosphor", :executable?
  end
end
