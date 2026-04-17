class Phosphor < Formula
  desc "Render images in your terminal — Kitty, Sixel, iTerm2 with tmux passthrough"
  homepage "https://github.com/alkautsarf/phosphor"
  version "0.4.0"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.4.0/phosphor-v0.4.0-darwin-arm64.tar.gz"
      sha256 "9a78a80ad9dfd3f4df6ad7bef05e40b2d3510b42e59eb66d264f34239d87de8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/phosphor/releases/download/v0.4.0/phosphor-v0.4.0-linux-x64.tar.gz"
      sha256 "30f732ec5bfe6b402365852e9da8a935fc18ab404a8fd5ddb1eed9f81a2d7414"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"phosphor"
    bin.install_symlink bin/"phosphor" => "ph"
    bin.install_symlink bin/"phosphor" => "pho"
  end

  test do
    assert_predicate bin/"phosphor", :executable?
  end
end
