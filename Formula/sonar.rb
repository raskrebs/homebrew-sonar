class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.1/sonar_darwin_arm64.tar.gz"
      sha256 "1ac625243068bd3c272fea60abb8dba1de244c8e7f1e4a5b072af254a6d29c60"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.1/sonar_darwin_amd64.tar.gz"
      sha256 "986ec75dbfecfba60d58156d781739dafc412f6c3f2aa7b46ce028242cad8a4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.1/sonar_linux_arm64.tar.gz"
      sha256 "aaeaedd1af88e3a5337ae6129907b31e72cd3ce4f92d95fb9f0ddab8dab215aa"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.1/sonar_linux_amd64.tar.gz"
      sha256 "833f7c73ad792eb38583730f5c9d0d5eadd577fd9d1f4fc4e82f3b3795247e56"
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
