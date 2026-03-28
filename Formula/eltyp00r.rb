class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.5.1/eltyp00r-v0.5.1-darwin-arm64.tar.gz"
      sha256 "21f3905ed6093b736303cd6b01169082b34b193c128c09667d90b203afe0dac0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.5.1/eltyp00r-v0.5.1-linux-x64.tar.gz"
      sha256 "5a4d2215729ab7d6e156bb2b788880b4759132b1fcb3860563514a6bd6bb3a03"
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
