class Alrm00r < Formula
  desc "Terminal alarm app for heavy sleepers, typing challenge to dismiss"
  homepage "https://github.com/alkautsarf/alrm00r"
  version "0.1.3"

  depends_on "tmux"
  depends_on "switchaudio-osx" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/alrm00r/releases/download/v0.1.3/alrm00r-v0.1.3-darwin-arm64.tar.gz"
      sha256 "3385fb8ec8edd68fe3da3dd017286ca84e1f7490e4d4fdada00f189fb5928d91"
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
