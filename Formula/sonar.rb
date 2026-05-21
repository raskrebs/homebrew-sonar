class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.0/sonar_darwin_arm64.tar.gz"
      sha256 "17e4465db870deeb6aec1c984fb8a251929cf8dd33bb76d3427adafd410eca63"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.0/sonar_darwin_amd64.tar.gz"
      sha256 "268c9a806ed60194cb2ea7dc2226de24691726f8c13f35b43b5609d4256c7960"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.0/sonar_linux_arm64.tar.gz"
      sha256 "37f2fdab094e68ad54b31134a857c6587671c5e5f4955c9f9109d636cb772221"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.0/sonar_linux_amd64.tar.gz"
      sha256 "9cbecc1f8f653f93705bc956800888ab1b2c5315c68b4d7d071c38574c0f7ab3"
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
