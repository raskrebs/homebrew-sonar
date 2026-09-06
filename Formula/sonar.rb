class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.1/sonar_darwin_arm64.tar.gz"
      sha256 "8607dfd181837dac412ffcbfc9fa3b1bbde1c1d0a7c66092d5bf96ecca5359e3"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.1/sonar_darwin_amd64.tar.gz"
      sha256 "730ec8e09b6e160d5a8cb1afbe64a1ad6bbbb1575e82ab49c79e0a3dfada5dd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.1/sonar_linux_arm64.tar.gz"
      sha256 "2abb6e9671d502465d0bb15c40ec1ea8946f93135c0c15e7d441f558afd03cb1"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.1/sonar_linux_amd64.tar.gz"
      sha256 "ca895021793684fd466c5ae16d7735ccc20ea7e69d5ec7d936e72d0858027c5f"
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
