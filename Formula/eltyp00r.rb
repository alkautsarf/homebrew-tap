class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.0/eltyp00r-v0.6.0-darwin-arm64.tar.gz"
      sha256 "c5d19dee662144617b9ce9e5e030c1930fd84b2e281ba10d36dab948fd04f181"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.0/eltyp00r-v0.6.0-linux-x64.tar.gz"
      sha256 "db465fe5cc264fcf9b16a7a822905fce0cc0f91fb1be7dbdddb3dc02e4b22b88"
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
