class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.3.1"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.3.1/phosphor-v0.3.1-darwin-arm64.tar.gz"
      sha256 "b3194abdddb71ad655134e50d2d105a8201d915e55be0806c9ceb7d1a417d109"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.3.1/phosphor-v0.3.1-linux-x64.tar.gz"
      sha256 "b150339c421ff8af7642c9645fc988f499725c855c74b42919936493f85fa8b6"
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
