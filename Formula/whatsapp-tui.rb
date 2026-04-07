class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.9/whatsapp-tui-v0.4.9-source.tar.gz"
  sha256 "10f7dd78f2fb35f568af78d297ae0083b5a1b7755e35be4c300aeac996e0d5ce"
  version "0.4.9"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system Formula["oven-sh/bun/bun"].opt_bin/"bun", "install", "--production", "--frozen-lockfile"
    end
    bin.write_exec_script libexec/"bin/wa"
    bin.install_symlink bin/"wa" => "watui"
  end

  test do
    assert_predicate bin/"wa", :executable?
  end
end
