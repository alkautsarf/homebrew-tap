class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.4/kura-v0.1.4-darwin-arm64.tar.gz"
      sha256 "e19a23a8ac25fa9e2e6b129d55da6142d65e9996a25fc8a6a13dce8de334d04d"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.4/kura-v0.1.4-linux-x64.tar.gz"
      sha256 "9e22bb19a2eb598d8c37a4fc58373bcf7184c05a8369dd3103ecb4639dde58a4"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.4", shell_output("#{bin}/kura --version")
  end
end
