class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.9/kura-v0.1.9-darwin-arm64.tar.gz"
      sha256 "1df931b27e525aacaf3eae4b588735b957ecbaf12b3e6a7d99124ee67544a8e2"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.9/kura-v0.1.9-linux-x64.tar.gz"
      sha256 "5804437ef20616c0e1e7b6d320e4f6affa2c36dc7a6875b7be4b5aec98ee2225"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.9", shell_output("#{bin}/kura --version")
  end
end
