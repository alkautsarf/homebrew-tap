class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.1/kura-v0.1.1-darwin-arm64.tar.gz"
      sha256 "1cefa0b425cfe7a594e34061a61253976635e1250514342a78316e7fbd930f10"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.1/kura-v0.1.1-linux-x64.tar.gz"
      sha256 "6ad9008846a74f0002044821cad28707c892dfe1844577ff4205507b3dc99826"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.1", shell_output("#{bin}/kura --version")
  end
end
