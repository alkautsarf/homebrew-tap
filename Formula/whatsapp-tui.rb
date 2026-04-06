class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  version "0.4.2"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.2/whatsapp-tui-v0.4.2-darwin-arm64.tar.gz"
      sha256 "9768cdaf1ea272a0b44e52310a6d04f422477108034d4b27c76e2e87d7e77ed3"
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
