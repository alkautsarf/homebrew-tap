class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.7/kura-v0.1.7-darwin-arm64.tar.gz"
      sha256 "56cf20ec8cf04e46a215837117cb5368a9859c1345a21e69a44ef9ff18697268"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.7/kura-v0.1.7-linux-x64.tar.gz"
      sha256 "a7eb1222f4686e09e6ab7d082933b78887d70b6b97aed4be3bdbe93764fb69d3"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.7", shell_output("#{bin}/kura --version")
  end
end
