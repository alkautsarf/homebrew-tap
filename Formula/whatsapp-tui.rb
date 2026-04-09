class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.5.1/whatsapp-tui-v0.5.1-source.tar.gz"
  sha256 "504b29554f6f215642ecdd8994c50efcc6f58379c1c6c998c1221e8bc2f81156"
  version "0.5.1"
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
