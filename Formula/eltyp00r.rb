class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.3.3/eltyp00r-v0.3.3-darwin-arm64.tar.gz"
      sha256 "da41b4cf2eb1d41594bea32f2ea90da5926bf33e372b8a675f6ff1c642c47d37"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "eltyp00r-darwin-arm64" => "eltyp00r"
    end
  end

  test do
    assert_predicate bin/"eltyp00r", :executable?
  end
end
