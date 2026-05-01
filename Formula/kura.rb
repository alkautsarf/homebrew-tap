class Kura < Formula
  desc "EVM terminal wallet"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.18/kura-v0.1.18-darwin-arm64.tar.gz"
      sha256 "84e71c5157c38a5ac890b8f02145e72f765594e8a4cfb50391c64b69742c5a7a"

      def install
        bin.install "kura-darwin-arm64" => "kura"
        bin.install "kura-signer"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.18/kura-v0.1.18-linux-x64.tar.gz"
      sha256 "1b29077883e1a1a567b49dab54adf13fa9a7c9b8f7cc19f33c8d9f2b30bd399d"

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
    assert_match "kura 0.1.17", shell_output("#{bin}/kura --version")
  end
end
