class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.2/sonar_darwin_arm64.tar.gz"
      sha256 "18af8bf4ccfa211f79f2fa2d0868ec4ede2b0a836284de48a01fdf2a406c4455"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.2/sonar_darwin_amd64.tar.gz"
      sha256 "1d2e5d6a892af6e1f373cad1112423363bcc5b5ab778c118238e6d156b816f15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.2/sonar_linux_arm64.tar.gz"
      sha256 "e1292f0f7c2c5d887c4f1248e42e44dea5473129b11a33f1dee7bfac693c2683"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.2/sonar_linux_amd64.tar.gz"
      sha256 "aa7a38e3cc4b7668178221828fe34730dde70c7034da5fb6df0d4af9cb74d429"
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
