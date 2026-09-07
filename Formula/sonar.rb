class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.4/sonar_darwin_arm64.tar.gz"
      sha256 "1e471249f25f3abd85e16e4b44d1a605c50566ad02aee18b72b475c529acdb9f"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.4/sonar_darwin_amd64.tar.gz"
      sha256 "7b334bb3e8dcb56993fb629ca21a5197631abbc8ec147108ef582a3770da2f9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.4/sonar_linux_arm64.tar.gz"
      sha256 "d1f59f7bb120788e337e34b91c2171ffab5345102ac0ed271604bd55627d3fcd"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.4/sonar_linux_amd64.tar.gz"
      sha256 "af3126ff7a08b17346fe11d3780ddd77a6b31200e77f9ef4dc38af1b95e90a73"
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
