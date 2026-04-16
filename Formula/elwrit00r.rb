class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.6.4"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.6.4/elwrit00r-v0.6.4-darwin-arm64.tar.gz"
      sha256 "a96b82e20bea2aebcf7192af502ddfd1c5f1a3a96f6ffe91a45f4e6102749f50"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "elwrit00r-darwin-arm64" => "elwrit00r"
    end
  end

  test do
    assert_predicate bin/"elwrit00r", :executable?
  end
end
