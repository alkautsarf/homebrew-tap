class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.7.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.2/eltyp00r-v0.7.2-darwin-arm64.tar.gz"
      sha256 "6c6ae2dc4e44d4bdaaed0b3400e8d7806c4ab5d3eaf45451a6f2c1ea8beac42b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.2/eltyp00r-v0.7.2-linux-x64.tar.gz"
      sha256 "e8b351ac92ef3f76c4901fbd79fac5f255dca84cf8caf019f2f994757fd27732"
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
