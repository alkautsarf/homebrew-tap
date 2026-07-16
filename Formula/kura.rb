class Kura < Formula
  desc "EVM terminal wallet"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.24/kura-v0.1.24-darwin-arm64.tar.gz"
      sha256 "fc8663171551255c50ca634a41b70f45b4ee3c8a80ad67bcea19510e894662f4"

      def install
        bin.install "kura-darwin-arm64" => "kura"
        bin.install "kura-signer"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.24/kura-v0.1.24-linux-x64.tar.gz"
      sha256 "aa0ec601f899a8a4e2a4f5c5aeddfef1e3cd5a5df30c4b7b9fd1aa7d0fd22383"

      def install
        bin.install "kura-linux-x64" => "kura"
      end
    end
  end

  service do
    run [opt_bin/"kura", "daemon"]
    keep_alive true
    log_path var/"log/kura.log"
    error_log_path var/"log/kura.log"
  end

  def caveats
    <<~EOS
      Run the kura daemon as a background service so it auto-restarts on every upgrade:
        brew services start kura

      If you currently launch `kura daemon` manually, kill it first:
        pkill -f "kura daemon"

      Once enrolled, every `brew upgrade kura` triggers a daemon restart automatically.
      Logs at #{var}/log/kura.log.
    EOS
  end

  def post_install
    # If the user has already enrolled the daemon under brew services, force a
    # kill-and-restart via launchctl directly. `brew services restart` from
    # inside post_install was unreliable (kills daemon but new launch fails
    # silently — likely env/sandbox issue with the brew subprocess). launchctl
    # kickstart is the lower-level launchd primitive and works.
    plist_path = "#{Dir.home}/Library/LaunchAgents/homebrew.mxcl.kura.plist"
    if File.exist?(plist_path)
      system "/bin/launchctl", "kickstart", "-k", "gui/#{Process.uid}/homebrew.mxcl.kura"
    end
  end

  test do
    assert_match "kura 0.1.24", shell_output("#{bin}/kura --version")
  end
end
