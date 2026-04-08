class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.0/sonar_darwin_arm64.tar.gz"
      sha256 "34cc6d17ea64fac07e87e511d8f193b032d4982429672f993ec1eef07c3bcdb2"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.0/sonar_darwin_amd64.tar.gz"
      sha256 "f2f8077a1632b11a5c11a4180752d80111cf5a6874e6a4db41bad7802adead1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.0/sonar_linux_arm64.tar.gz"
      sha256 "bb0a2f9c20e4157927e78f28a403cbce71f8eb8772a4a5a984c7d5a766729349"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.2.0/sonar_linux_amd64.tar.gz"
      sha256 "71cea874ce050790d0880f1c36c4e3b207b4c27af0db363cb258084e4db31dfb"
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
