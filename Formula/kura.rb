class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.8/kura-v0.1.8-darwin-arm64.tar.gz"
      sha256 "8b1205115a78b8d6abbd3ff8b2828e8e590785e69e925d6198a02528f3e76e54"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.8/kura-v0.1.8-linux-x64.tar.gz"
      sha256 "38b2654cf68c59b6dcee2a95d6ca2009b09830c7fa5ea09c7ef5cf2a4d936307"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.8", shell_output("#{bin}/kura --version")
  end
end
