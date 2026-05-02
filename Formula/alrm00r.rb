class Alrm00r < Formula
  desc "Terminal alarm app for heavy sleepers, typing challenge to dismiss"
  homepage "https://github.com/alkautsarf/alrm00r"
  version "0.1.0"

  depends_on "tmux"
  depends_on "switchaudio-osx" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/alrm00r/releases/download/v0.1.0/alrm00r-v0.1.0-darwin-arm64.tar.gz"
      sha256 "b07cf8d94ef01c5f7bc26c13610ecd773ee21e81d3583b491018ce40d18cc6d3"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "alrm00r-darwin-arm64" => "alrm00r"
    end
    pkgshare.install Dir["sounds/*"] if Dir.exist?("sounds")
  end

  test do
    assert_predicate bin/"alrm00r", :executable?
    system bin/"alrm00r", "--version"
  end
end
