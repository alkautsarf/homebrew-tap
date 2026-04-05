class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.2.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.2.0/phosphor-v0.2.0-darwin-arm64.tar.gz"
      sha256 "fea34c0774e887bed35ce1229f5578c2d6bde532e6f16ddf52ec881596362457"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.2.0/phosphor-v0.2.0-linux-x64.tar.gz"
      sha256 "706735e6aed04a504aba24e33c08de9f980154c8fdae1aefaa8325f9867fd9f8"
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
