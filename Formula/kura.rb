class Kura < Formula
  desc "Wallet terminal for EVM. Daemon + tmux popup + 4 IO surfaces"
  homepage "https://github.com/alkautsarf/kura"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.13/kura-v0.1.13-darwin-arm64.tar.gz"
      sha256 "57a6a608f72ceb1bbc8c49fffacc1c90e015c666781157e1fcc867c6ec7baa32"

      def install
        bin.install "kura-darwin-arm64" => "kura"
        bin.install "kura-signer"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alkautsarf/kura/releases/download/v0.1.13/kura-v0.1.13-linux-x64.tar.gz"
      sha256 "a4a34e0463943364ecdc1207ee52b61c47a399998505b6e6c761debc672d2aba"

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
    # If the user has already enrolled the daemon under brew services, force a restart
    # so the freshly upgraded binary is in use. Pre-enrollment installs/upgrades skip
    # this (no plist exists yet) and rely on the caveats text above for setup.
    plist_path = "#{Dir.home}/Library/LaunchAgents/homebrew.mxcl.kura.plist"
    if File.exist?(plist_path)
      system "brew", "services", "restart", "kura"
    end
  end

  test do
    assert_match "kura 0.1.13", shell_output("#{bin}/kura --version")
  end
end
