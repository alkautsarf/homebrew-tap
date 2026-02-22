class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.2.1/elwrit00r-v0.2.1-darwin-arm64.tar.gz"
      sha256 "ee9b275450cf2641fed38d2efc8ec79b492123cb8901435209f42882d2fd17c3"
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
