class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.8.0/sonar_darwin_arm64.tar.gz"
      sha256 "ea1b599b3b5b90c7815592ead2443c7f56888fe5d7444672b609a209aa17ae81"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.8.0/sonar_darwin_amd64.tar.gz"
      sha256 "e743edfb2a565cec9a9a0ee1a8721de65f9ccef5f27885177ee2218b25de0626"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.8.0/sonar_linux_arm64.tar.gz"
      sha256 "a3967d379862fd1968eea65159518cc99e210c11405fb2aa0924dc864508ff25"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.8.0/sonar_linux_amd64.tar.gz"
      sha256 "5bc545ee29b2fdaf9288950d6d8cda4cb9c05a9cf046ebea1723042095893e53"
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
