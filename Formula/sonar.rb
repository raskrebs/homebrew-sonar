class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.6/sonar_darwin_arm64.tar.gz"
      sha256 "614ae299b64405a2f50c045610cf02ce0bd646ce70962d92a9a665c6c4a1ebb0"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.6/sonar_darwin_amd64.tar.gz"
      sha256 "c26c0a959f7c23e87aabd7d565743dd40fb3827e43fc3419d298777e1360e583"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.6/sonar_linux_arm64.tar.gz"
      sha256 "a2c043504c1ae31a1458694629c830dbc56a964dbae9c585220aadac029eafa3"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.6/sonar_linux_amd64.tar.gz"
      sha256 "b1a0310fea28650ddaadea9987339070e9e507b571d4fbeec7b01f77d0336adf"
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
