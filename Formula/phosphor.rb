class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.1.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-darwin-arm64.tar.gz"
      sha256 "6cdda1bfd56d0591199b9738f5f73f5ed0495873f0a00cdab82072386088cd74"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-linux-x64.tar.gz"
      sha256 "f43b681ab1da0658c75bed895b4fe94514031748ccbeabd79045ec56e0ffd672"
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
