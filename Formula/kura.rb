class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.10/kura-v0.1.10-darwin-arm64.tar.gz"
      sha256 "2742281aa073d79957a5326473d676f8ea270d2c444bb48b8c9a8f2d218f3dce"

      def install
        bin.install "kura-darwin-arm64" => "kura"
        bin.install "kura-signer"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.10/kura-v0.1.10-linux-x64.tar.gz"
      sha256 "21b7ddbc0583737150fd96153b6c23c93b1ecb711b0c6cf80565fc35e69469b6"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.10", shell_output("#{bin}/kura --version")
  end
end
