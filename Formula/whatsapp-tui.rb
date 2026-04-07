class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  version "0.4.3"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.3/whatsapp-tui-v0.4.3-darwin-arm64.tar.gz"
      sha256 "3143d0f876bba164f92ceaea776e7bc182b4f79c44463277c6f2288a71dd8d5d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/wa"
    bin.install_symlink bin/"wa" => "watui"
  end

  test do
    assert_predicate bin/"wa", :executable?
  end
end
