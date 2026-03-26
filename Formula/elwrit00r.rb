class Elwrit00r < Formula
  desc "Terminal writing app with vim keybindings and AI companion"
  homepage "https://github.com/alkautsarf/elwrit00r"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/alkautsarf/elwrit00r/releases/download/v0.5.0/elwrit00r-v0.5.0-darwin-arm64.tar.gz"
      sha256 "253ddd0b34a20feecd8eeaf78f009aad56e36cb84ce3a6868ed788dd8005ec9a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "elwrit00r-darwin-arm64" => "elwrit00r"
    end
  end

  test do
    assert_predicate bin/"elwrit00r", :executable?
  end
end
