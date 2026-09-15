class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.0/sonar_darwin_arm64.tar.gz"
      sha256 "71ba8289f9d51f615c0a6c995c49f7ecf2659c1d91dc595039a9bb7a9d4cf7b9"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.0/sonar_darwin_amd64.tar.gz"
      sha256 "00402db3928bf9491699fadfcff9b530a3ab4230fe786e06e4eb7bfa3ff33e4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.0/sonar_linux_arm64.tar.gz"
      sha256 "92a1183b7444e35a08efd9a8fe9f2a730c2e03e253403b3c2669ff149343c1ca"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.0/sonar_linux_amd64.tar.gz"
      sha256 "07e1e7357cd4a57e583052582d6c62909673d1d4cec5e9b35ac0f9d1003243df"
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
