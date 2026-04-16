class Hakr < Formula
  desc "Full-featured Hacker News TUI with read and write support"
  homepage "https://github.com/alkautsarf/hakr"
  url "https://github.com/alkautsarf/hakr/releases/download/v0.3.0/hakr-v0.3.0.tar.gz"
  sha256 "17f4dc7e430510d3dc77c3becd31987e44ff498e86f58fcceff69bca75ae910f"
  version "0.3.0"
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
