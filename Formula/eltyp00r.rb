class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.2/eltyp00r-v0.6.2-darwin-arm64.tar.gz"
      sha256 "58209d248af998cf01bf62e7ff30e18ae4fff650326e4e71106724c446d9ade9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.2/eltyp00r-v0.6.2-linux-x64.tar.gz"
      sha256 "240bad7a47bf36872b4223138a16c12f299b52b3972e869f7ef1991d05a73e8e"
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
