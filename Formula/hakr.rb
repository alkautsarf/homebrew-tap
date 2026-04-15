class Hakr < Formula
  desc "Full-featured Hacker News TUI with read and write support"
  homepage "https://github.com/alkautsarf/hakr"
  url "https://github.com/alkautsarf/hakr/releases/download/v0.1.0/hakr-v0.1.0.tar.gz"
  sha256 "0f86e3fc9c9c4b0ee62c314eafcf5a7652fabc39216a2f00de4f7df70dd81a11"
  version "0.1.0"
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
