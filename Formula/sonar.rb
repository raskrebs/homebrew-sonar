class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.0/sonar_darwin_arm64.tar.gz"
      sha256 "0066ada37ecffc74a0e54a97aee0e76e6bb7eeb6cf88fed07c52b7970ad99d7c"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.0/sonar_darwin_amd64.tar.gz"
      sha256 "2ba41a950e38ecfeb3f594592978de55624eb82cd9ade55da8ed4300e006c3ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.0/sonar_linux_arm64.tar.gz"
      sha256 "e48570a81434686696dcef983f4758c8c3a7ed2aad4e4f159106257b51aed365"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.0/sonar_linux_amd64.tar.gz"
      sha256 "f39d4a5bae986a4cefcd927680b4b2f6bfa065cf488baffce40e8af39f59e909"
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
