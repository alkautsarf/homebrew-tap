class Hakr < Formula
  desc "Full-featured Hacker News TUI with read and write support"
  homepage "https://github.com/alkautsarf/hakr"
  url "https://github.com/alkautsarf/hakr/releases/download/v0.2.2/hakr-v0.2.2.tar.gz"
  sha256 "d244148825b47476585b04ad2b6d747df69d51ab83768e14fd0ddf1b1b5d6bd3"
  version "0.2.2"
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
