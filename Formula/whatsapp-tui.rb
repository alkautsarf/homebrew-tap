class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.12/whatsapp-tui-v0.4.12-source.tar.gz"
  sha256 "4d5ebe260629885e248c7ddd7b13eb2df9fadbf2e0f380279a74ae1b6f083241"
  version "0.4.12"
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
