class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.1.2/eltyp00r-v0.1.2-darwin-arm64.tar.gz"
      sha256 "dc973f55df2ce1fc4abee6dc6f0f6d04a323c0888ef94f9d72ba20cf93ae6a77"
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
