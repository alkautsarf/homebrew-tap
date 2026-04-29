class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.3/kura-v0.1.3-darwin-arm64.tar.gz"
      sha256 "99b3e375b2b8af5e9b4fb3170ef08a01ae89e036b7b2a2012040427c5fbdfba2"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.3/kura-v0.1.3-linux-x64.tar.gz"
      sha256 "92df4bffcbf951f8ccc7d2c84e2c3f1b3d5186a2531e44c61c8d6f5ef78f593f"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.3", shell_output("#{bin}/kura --version")
  end
end
