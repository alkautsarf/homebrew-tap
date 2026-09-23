class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.1/eltyp00r-v0.7.1-darwin-arm64.tar.gz"
      sha256 "5578fd630803a542b4389929affd2b5ec84aa429dae2bb32381b22e1c0770681"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.7.1/eltyp00r-v0.7.1-linux-x64.tar.gz"
      sha256 "16e7e31e556f001b2cb5827f8bf0f3cfca0900d081fc8fec79f00e1e9793e0f3"
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
