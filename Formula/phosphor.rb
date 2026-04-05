class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.1.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-darwin-arm64.tar.gz"
      sha256 "4bc42d6dcb004688cec2d5be8a5272182304a67ba43b74cb34eb3c711a97678c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-linux-x64.tar.gz"
      sha256 "4d680d94b249f05ae03e6ec43b2b0d07f0e254a976d20c3b5dcf761d1f73211a"
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
