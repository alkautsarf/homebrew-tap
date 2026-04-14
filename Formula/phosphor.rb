class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.3.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.3.0/phosphor-v0.3.0-darwin-arm64.tar.gz"
      sha256 "7ad7a9fa7adfc33af2a2d3aa24db669ce50081288a76329553543b43eff0e5d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.3.0/phosphor-v0.3.0-linux-x64.tar.gz"
      sha256 "52efb6b2dd797359e049b47d05d7385f4859ba6727615001664d1fe1b7018a0c"
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
