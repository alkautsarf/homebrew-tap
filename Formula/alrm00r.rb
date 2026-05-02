class Alrm00r < Formula
  desc "Terminal alarm app for heavy sleepers, typing challenge to dismiss"
  homepage "https://github.com/alkautsarf/alrm00r"
  version "0.1.1"

  depends_on "tmux"
  depends_on "switchaudio-osx" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/alrm00r/releases/download/v0.1.1/alrm00r-v0.1.1-darwin-arm64.tar.gz"
      sha256 "807a428c78ae80addf42e7153042e3cbf9d13a9e2dd2f229e7952fa62d4fc89c"
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
