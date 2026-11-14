class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.7.2/elwrit00r-v0.7.2-darwin-arm64.tar.gz"
      sha256 "ad8bcaf1e6d7f6fd687dbbf823f7d792e2eaafc60bbf016f1b1ebe39cc43b15d"
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
