class WhatsappTui < Formula
  desc "WhatsApp TUI client with vim keybindings"
  homepage "https://github.com/alkautsarf/whatsapp-tui-ts"
  url "https://github.com/alkautsarf/whatsapp-tui-ts/releases/download/v0.4.13/whatsapp-tui-v0.4.13-source.tar.gz"
  sha256 "b88ed8bcb2f6c28c85d58180262112d8d6db20f92758e1a7fc2bd107f677460a"
  version "0.4.13"
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
