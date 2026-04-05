class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-darwin-arm64.tar.gz"
      sha256 "f513681bb2522cb0f5fe88a502ce2de2455ec6b0f4be7a924415489cd6152573"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.1.0/phosphor-v0.1.0-linux-x64.tar.gz"
      sha256 "bfc6fa9d897682d57930797109c3327b43889a7a4cd272bd7dff02f97cfc9f23"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "phosphor-darwin-arm64" => "phosphor"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "phosphor-linux-x64" => "phosphor"
    end
    bin.install_symlink "phosphor" => "ph"
    bin.install_symlink "phosphor" => "pho"
  end

  test do
    assert_predicate bin/"phosphor", :executable?
  end
end
