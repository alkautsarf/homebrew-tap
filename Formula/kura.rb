class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.2/kura-v0.1.2-darwin-arm64.tar.gz"
      sha256 "2fce08d1e23103298be26befbe04feeffc2e80215fff6499f1ba476bb444816d"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.2/kura-v0.1.2-linux-x64.tar.gz"
      sha256 "73e0da650da6bf07662bd60a2a228853d9ae6ad3e8336c8e88c6b91adaadda5a"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.2", shell_output("#{bin}/kura --version")
  end
end
