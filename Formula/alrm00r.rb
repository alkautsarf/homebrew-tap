class Alrm00r < Formula
  desc "Terminal alarm app for heavy sleepers, typing challenge to dismiss"
  homepage "https://github.com/alkautsarf/alrm00r"
  version "0.1.2"

  depends_on "tmux"
  depends_on "switchaudio-osx" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/alrm00r/releases/download/v0.1.2/alrm00r-v0.1.2-darwin-arm64.tar.gz"
      sha256 "148d6cd0f717d1d19f86b2de129512e29dbd8e3ee67095fe654b386bf5eb6d91"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "alrm00r-darwin-arm64" => "alrm00r"
    end
    (pkgshare/"sounds").install Dir["sounds/*"] if Dir.exist?("sounds")
  end

  test do
    assert_predicate bin/"alrm00r", :executable?
    system bin/"alrm00r", "--version"
  end
end
