# Homebrew formula for blip. Lives in alkautsarf/homebrew-tap.
# Head-only strategy: builds from source on every install, so pushing to
# main + `brew upgrade --fetch-HEAD alkautsarf/tap/blip` pulls the latest.
class Blip < Formula
  desc "macOS notch app for terminal-native Claude Code users"
  homepage "https://github.com/alkautsarf/blip"
  head "https://github.com/alkautsarf/blip.git", branch: "main"
  license "MIT"

  depends_on :macos => :sonoma
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/Blip"      => "blip"
    bin.install ".build/release/BlipApp"   => "BlipApp"
    bin.install ".build/release/BlipHooks" => "BlipHooks"
    bin.install ".build/release/BlipSetup" => "BlipSetup"
  end

  # NOTE: `brew` sandboxes post_install to the cellar + prefix, so we
  # can't assemble ~/Applications/Blip.app from here (the write is
  # blocked even with HOMEBREW_NO_SANDBOX). Users run `blip install`
  # after every brew upgrade — the command is fully idempotent and
  # refreshes the bundle + kickstarts launchd, so the TCC grant still
  # persists.

  def caveats
    <<~EOS
      One-shot setup (bundle + hooks + LaunchAgent + start):

        blip install

      On first launch macOS prompts for Accessibility. Grant it to
      "Blip.app" under:

        System Settings → Privacy & Security → Accessibility

      After future `brew upgrade`s, just run `blip install` again — it's
      idempotent and refreshes the bundle with the new binary, preserving
      your Accessibility grant thanks to the stable bundle identifier.

      For jump-to-tmux to work, set @cwd on every pane — see README.

      To remove cleanly:

        blip uninstall
    EOS
  end

  test do
    system "#{bin}/blip", "help"
  end
end
