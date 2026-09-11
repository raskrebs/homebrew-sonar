class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.7.0/sonar_darwin_arm64.tar.gz"
      sha256 "320966232a5fca43d416c6ae2ea6aaa54289ead05c1cd219c9e654fba9a72801"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.7.0/sonar_darwin_amd64.tar.gz"
      sha256 "26d0b47d6aedf0e90366a1f91b9694cad6f10ebcf63c7b88ac8fbbe8078278a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.7.0/sonar_linux_arm64.tar.gz"
      sha256 "5f3043823ffaabab3f6bb7959b590c50814bcba44cabadfbe40116517bc73504"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.7.0/sonar_linux_amd64.tar.gz"
      sha256 "03171c937fa4e491fa8b0e0056b5005e462570840f6d662f250503e4486ff8b3"
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
