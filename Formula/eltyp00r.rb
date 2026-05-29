class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.0/eltyp00r-v0.7.0-darwin-arm64.tar.gz"
      sha256 "e672730a2da2840d42bbe5a50953bb36973ba60c02ee5540f624cd51b606b046"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.0/eltyp00r-v0.7.0-linux-x64.tar.gz"
      sha256 "5fbaeda4b0f96ef516da7446560f190b21a89776284f58d34bbad5b4780acf98"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "eltyp00r-darwin-arm64" => "eltyp00r"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "eltyp00r-linux-x64" => "eltyp00r"
    end
  end

  test do
    assert_predicate bin/"eltyp00r", :executable?
  end
end
