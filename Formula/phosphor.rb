class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.4.1"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.4.1/phosphor-v0.4.1-darwin-arm64.tar.gz"
      sha256 "bd1358ca58755ac866e6396850668a958cc14664d3e1f46ba96733c5aaca337b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.4.1/phosphor-v0.4.1-linux-x64.tar.gz"
      sha256 "546fccfa7f4060be9ea767129d18cf32616a583ba4a20cd7d625bedac5154c20"
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
