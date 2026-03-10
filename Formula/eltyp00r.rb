class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.4.2/eltyp00r-v0.4.2-darwin-arm64.tar.gz"
      sha256 "3593f152680b0a36fbb3da3c48a85315d04054bc15f5524d091dec571752f406"
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
