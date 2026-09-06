class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.3/sonar_darwin_arm64.tar.gz"
      sha256 "0a59abef81d99154b4a3de5d83cfbedef62bde9b7f9cc435ef7cdce98ab6f566"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.3/sonar_darwin_amd64.tar.gz"
      sha256 "fb316dc2e5d5e016b29ba6b9277ff5e33f201bb9b9827107a86dae428a700a18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.3/sonar_linux_arm64.tar.gz"
      sha256 "729d2b259a7a01d84cde2be2d50a2f74be7cff9164a773a8f8f7d15273c8ecd6"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.3/sonar_linux_amd64.tar.gz"
      sha256 "f96484da14703ac0d0f034ae37565ebfd6dc4f8c13d5d41ca90fb1504e974922"
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
