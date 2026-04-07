class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  version "0.4.4"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.4/whatsapp-tui-v0.4.4-darwin-arm64.tar.gz"
      sha256 "ed2f0f810d3667d98bdbcef08211312fb679bf9d6940041669f34272c7787bba"
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
