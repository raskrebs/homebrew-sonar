class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.0/sonar_darwin_arm64.tar.gz"
      sha256 "5b1c16b7c2f6b20cbb9c72dd6272587c2a09da4f2c0cfcb1fc58e101822a0ad2"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.0/sonar_darwin_amd64.tar.gz"
      sha256 "4d8f1e83a8bdcf739d85b37ea6af4e33fe7fcd72dd0b3ef7be03d06dd2ffb474"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.0/sonar_linux_arm64.tar.gz"
      sha256 "670abe65856de86bfa6848537da18f755388e407bdf9c3375b5512dd2aeb2b3b"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.5.0/sonar_linux_amd64.tar.gz"
      sha256 "61d01797726dbb7fa0ed04682fcde792c5ce845d4eb7e75d3fc64585f0a8792b"
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
