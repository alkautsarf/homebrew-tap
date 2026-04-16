class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.6.3"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.3/eltyp00r-v0.6.3-darwin-arm64.tar.gz"
      sha256 "43372139e59b62891086d1aaeace756f46b274ecf0b5569fe10dc8aac5f9054d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.6.3/eltyp00r-v0.6.3-linux-x64.tar.gz"
      sha256 "46c24ff2c7ac02d61944a2e48dfba217fc25b849907f4801aca5a162c8ab8069"
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
