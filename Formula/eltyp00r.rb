class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.1/eltyp00r-v0.6.1-darwin-arm64.tar.gz"
      sha256 "721346d0240fb4d20b70547849a51f75aa5d398f0347d431dd0c57d8ea4b101e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.1/eltyp00r-v0.6.1-linux-x64.tar.gz"
      sha256 "327c514b0eb145cca6f67623188a4bbdec6583dcba4eb5a4d2013f09dbf81998"
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
