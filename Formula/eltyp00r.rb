class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.1.3/eltyp00r-v0.1.3-darwin-arm64.tar.gz"
      sha256 "9d331bcfdbf120782f3fc84e2dc0e02e75dc0a5c91a7626709a5d2559816da44"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "eltyp00r-darwin-arm64" => "eltyp00r"
    end
  end

  test do
    assert_predicate bin/"eltyp00r", :executable?
  end
end
