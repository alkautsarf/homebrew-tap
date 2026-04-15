class Hakr < Formula
  desc "Full-featured Hacker News TUI with read and write support"
  homepage "https://github.com/alkautsarf/hakr"
  url "https://github.com/alkautsarf/hakr/releases/download/v0.2.0/hakr-v0.2.0.tar.gz"
  sha256 "fae9c7dc40ceee2e76ec568a9701b47722dcbbe4e17231251e73d55e9a7106a0"
  version "0.2.0"
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
