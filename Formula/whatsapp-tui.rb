class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  version "0.4.1"
  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.1/whatsapp-tui-v0.4.1-darwin-arm64.tar.gz"
      sha256 "31d092a6d0134fb700651ed8bfe0363600d936fd949a2a228534eee747b437a2"
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
