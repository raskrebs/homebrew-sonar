class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_darwin_arm64.tar.gz"
      sha256 "a4ce390e1fac4d37ab6ad92136cc53693e45a6823d0ec23c9f8bea34145fc7e5"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_darwin_amd64.tar.gz"
      sha256 "a52ad807228c19291761e520e3121f6fa583c0309ec345c82910646d5d3e9a25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_linux_arm64.tar.gz"
      sha256 "36e11261710059442c88ea87ad51c7d203bf37aee01f720641c9547c89770f30"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_linux_amd64.tar.gz"
      sha256 "bd3c355e6830a47b12925cdaef9fc2b767fd74a61bbd24e135520ba1e4cfd7ce"
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
