class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.10.0/sonar_darwin_arm64.tar.gz"
      sha256 "825a74a6da9de79bba3772e45170f53b402b0d75580b0d57e6901956a98bfdf8"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.10.0/sonar_darwin_amd64.tar.gz"
      sha256 "27e43c83f52334a21e6839d556cea74e0fcc7ef058b3e477acbd696e423ad886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.10.0/sonar_linux_arm64.tar.gz"
      sha256 "59a01e78756189ad17a786699522ec4b42d244662b9c6b695d6a5ce67bbf10e7"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.10.0/sonar_linux_amd64.tar.gz"
      sha256 "e322f75639b0cb60ee62901706f7f04e5b43e82b81ac6378000a277f2b110e9f"
    end
  end

  def install
    bin.install "sonar"
    bin.install "sonar-tray" if OS.mac? && File.exist?("sonar-tray")

    generate_completions_from_executable(bin/"sonar", "completion")
  end

  test do
    assert_match "sonar", shell_output("#{bin}/sonar --help")
  end
end
