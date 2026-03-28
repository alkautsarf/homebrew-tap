class Eltyp00r < Formula
  desc "Terminal typing trainer with adaptive difficulty and AI coaching"
  homepage "https://github.com/alkautsarf/eltyp00r"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.5.0/eltyp00r-v0.5.0-darwin-arm64.tar.gz"
      sha256 "d5eaaddce413a4518245b3c1027f8df016ad3f70e3e2b4fca1e04f02774934ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/eltyp00r/releases/download/v0.5.0/eltyp00r-v0.5.0-linux-x64.tar.gz"
      sha256 "e99db1acab6f7574bc4e32a000ddd0c10dc60f34248a42cd06553aa6566f9ef8"
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
