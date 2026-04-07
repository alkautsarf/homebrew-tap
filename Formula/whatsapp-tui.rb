class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.5/whatsapp-tui-v0.4.5-source.tar.gz"
  sha256 "5d5b9e6017588f95e10c39a19eeaddbb987aa18cf29fe9d36f73dbd2a1b2ea8e"
  version "0.4.5"
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
