class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.3.0/sonar_darwin_arm64.tar.gz"
      sha256 "ec788a53c346e0f6d97a95e5a3a85c882f5efa7513d7c782aa5d4954fd00eafd"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.3.0/sonar_darwin_amd64.tar.gz"
      sha256 "f3c48510fac88a803076fe1122253bf480a6b10e7e8332e49edb94ccbbd205bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.3.0/sonar_linux_arm64.tar.gz"
      sha256 "755262157d62e719818bad1f1b54ea1df6ee781d368a6542340db5860f2a3b98"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.3.0/sonar_linux_amd64.tar.gz"
      sha256 "5c027a7448df4481bec317b3551034c90eaed1584e82314bce1dc39602aabfb9"
    end
  end

  def install
    bin.install "sonar"
    bin.install "sonar-tray" if OS.mac? && File.exist?("sonar-tray")
  end

  test do
    assert_match "sonar", shell_output("#{bin}/sonar --help")
  end
end
