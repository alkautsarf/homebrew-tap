class Hakr < Formula
  desc "Full-featured Hacker News TUI with read and write support"
  homepage "https://github.com/alkautsarf/hakr"
  url "https://github.com/alkautsarf/hakr/releases/download/v0.2.1/hakr-v0.2.1.tar.gz"
  sha256 "7b85292713eec53a1c51fd600d9b3a4bf1d460f66d22074c242914c508102268"
  version "0.2.1"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system Formula["oven-sh/bun/bun"].opt_bin/"bun", "install", "--production", "--frozen-lockfile"
    end
    bin.write_exec_script libexec/"bin/hakr"
  end

  test do
    assert_predicate bin/"hakr", :executable?
  end
end
