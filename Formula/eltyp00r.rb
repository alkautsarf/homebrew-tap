class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.2.2/eltyp00r-v0.2.2-darwin-arm64.tar.gz"
      sha256 "3564cf7a3068849b48bbca7a811e76855fdf7dcc44ee9372cfe82ca1a561a60a"
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
