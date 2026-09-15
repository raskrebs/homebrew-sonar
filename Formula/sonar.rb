class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.1/sonar_darwin_arm64.tar.gz"
      sha256 "42ccb9da4fba4d42552982be071cc517cd5a220a413657e1ae469f7c88bb82a9"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.1/sonar_darwin_amd64.tar.gz"
      sha256 "09378b3bd022f7ec6befe3c4d09f7bc69b5438c23703ff6b6cbd9f56952def9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.1/sonar_linux_arm64.tar.gz"
      sha256 "3eb118f2c16380947bcc0fde250c24b2954f7721ee55f1e205f1edc7a95bcb7e"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.9.1/sonar_linux_amd64.tar.gz"
      sha256 "5a368ff26366c0f57fa1df098b55f8ee1b3b827d8a44c08fb3a085879653a246"
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
