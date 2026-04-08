class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.9/sonar_darwin_arm64.tar.gz"
      sha256 "c2120147aafa0dc7984844246a85acc6a685f283249993c1947194a26fca7aeb"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.9/sonar_darwin_amd64.tar.gz"
      sha256 "f262e6519b6bbdc4130c4f3e996d02d222d4057bf439da77c1f3d7489de29bf0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.9/sonar_linux_arm64.tar.gz"
      sha256 "54b30ee8c1ece0161ad5bbf4775d94b6638ecf80be5c880f437fe03c3b0a8635"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.9/sonar_linux_amd64.tar.gz"
      sha256 "5bf5af3c8853337980cc458e29f1912552a9d58ce662306ff5c976ba6f0290a0"
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
