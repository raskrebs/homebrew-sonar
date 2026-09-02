class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_darwin_arm64.tar.gz"
      sha256 "4342b98cb18d7105be30baa8ea7a8455eec51f376289c68efd292e5f08094d9a"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_darwin_amd64.tar.gz"
      sha256 "8ceea3e6f0ecae045c8af011bd3ff035cf2a994ef5873e5be9879c23610aeccd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_linux_arm64.tar.gz"
      sha256 "554826c1dea46e8c188bc9a466f29b6c79f2cdf86dd3402bcfdde8cc0c4edceb"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.4.1/sonar_linux_amd64.tar.gz"
      sha256 "bddb75b36200d976672296b835c208456d06d37976b21fb0860cf3db5d4fb628"
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
