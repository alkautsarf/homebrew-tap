class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.7.1/elwrit00r-v0.7.1-darwin-arm64.tar.gz"
      sha256 "0610a71ea190278cbb521568fccd7b3c6f56a0b1fd2cf306b273e1cd5fdb8790"
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
