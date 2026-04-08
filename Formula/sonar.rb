class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.8/sonar_darwin_arm64.tar.gz"
      sha256 "dd9e0f517efbadff949f95597ce02f2ac667b3796b5c9c882e99c451c300a700"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.8/sonar_darwin_amd64.tar.gz"
      sha256 "b02a8c5a544ecef4106f92b8a4212f0002dc465a0c092bff29a0ee081c88bfcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.8/sonar_linux_arm64.tar.gz"
      sha256 "4e7f43e2fd1c9d93fbbe4cdae5d2db95d112e660d829df00c07650a3e7bb5748"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.8/sonar_linux_amd64.tar.gz"
      sha256 "7ac557b4041e60ef67c09a121cdd9fde2a717008f163529499efb504b3db23b5"
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
