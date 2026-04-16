class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.6.4"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.4/eltyp00r-v0.6.4-darwin-arm64.tar.gz"
      sha256 "e710dab55fefe7bd60d55d73919af90518fc76f50b8838d5c1c88882325f7f9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.4/eltyp00r-v0.6.4-linux-x64.tar.gz"
      sha256 "504e177a4db9345cffda6c0ff831aa0b6fe43ea33a788fb02414681ec96a95b7"
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
