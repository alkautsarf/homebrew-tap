class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.4.3/eltyp00r-v0.4.3-darwin-arm64.tar.gz"
      sha256 "a9d135d391a000bd4691ad3ccab74c4b053a2992f7ce3198353b6d7125fc17d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.4.3/eltyp00r-v0.4.3-linux-x64.tar.gz"
      sha256 "fa72d9ffa98feccdff4c919ee13088123f328a5e0dd3eab62a72e4327ccbcfaf"
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
