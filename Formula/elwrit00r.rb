class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.2.0/elwrit00r-v0.2.0-darwin-arm64.tar.gz"
      sha256 "cf974055c8814149e58b03e40ef48cf33e14768e946990c945625ff57c192b25"
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
