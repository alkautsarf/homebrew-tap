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

  # After every install/upgrade, rebuild ~/Applications/Blip.app with a
  # stable CFBundleIdentifier + designated requirement. macOS TCC keys
  # Accessibility grants by the DR, so doing this on every upgrade lets
  # the user's permission survive forever. If the LaunchAgent is already
  # loaded, bundle-refresh also kickstarts it so the running process
  # picks up the new binary automatically.
  def post_install
    system "#{bin}/BlipSetup", "bundle-refresh"
  end

  def caveats
    <<~EOS
      One-shot setup (bundle + hooks + LaunchAgent + start):

        blip install

      On first launch macOS prompts for Accessibility. Grant it to
      "Blip.app" under:

        System Settings → Privacy & Security → Accessibility

      The grant persists across every future `brew upgrade` thanks to
      the stable bundle identifier — no re-toggling.

      For jump-to-tmux to work, set @cwd on every pane — see README.

      To remove cleanly:

        blip uninstall
    EOS
  end

  test do
    system "#{bin}/blip", "help"
  end
end
