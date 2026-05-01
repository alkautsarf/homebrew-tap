class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.5/kura-v0.1.5-darwin-arm64.tar.gz"
      sha256 "89e3bc65d2213835adfbb51b02f0d196c9255d54e3148a4b39194f5b6ed0d346"

      def install
        bin.install "kura-darwin-arm64" => "kura"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.5/kura-v0.1.5-linux-x64.tar.gz"
      sha256 "d9ebe660df8442f235b5acaa8674c3e72369fcfe7d46f96323f4d485bf2c0535"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  test do
    assert_match "kura 0.1.5", shell_output("#{bin}/kura --version")
  end
end
