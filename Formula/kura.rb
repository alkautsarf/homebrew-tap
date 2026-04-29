class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.0/kura-v0.1.0-darwin-arm64.tar.gz"
      sha256 "bf62b7957ea06cd2c27d6e8cf41b50dab7fd5838bb20bf55b288e4d94b7965af"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.0/kura-v0.1.0-linux-x64.tar.gz"
      sha256 "c293e13376b7bf19a00b8c60165827891414ad822adba14e590eb24e42d33df1"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.0", shell_output("#{bin}/kura --version")
  end
end
