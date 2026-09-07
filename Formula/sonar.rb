class Sonar < Formula
  desc "CLI tool for monitoring ports and processes"
  homepage "https://github.com/RasKrebs/sonar"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.5/sonar_darwin_arm64.tar.gz"
      sha256 "7cf9cd7dcd52ff2500dc10a05f9da1e9968af6a28a63b55c2f27479827c90818"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.5/sonar_darwin_amd64.tar.gz"
      sha256 "06ffc16d6c2d8076776d1c31b595e53ffb12d84b03fe33d1ee933a59a0db1887"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.5/sonar_linux_arm64.tar.gz"
      sha256 "123ba5d15111b8b82319806f830ea79600d26dcd1efd6e40d71b3bb9db578b94"
    end
    on_intel do
      url "https://github.com/RasKrebs/sonar/releases/download/v0.6.5/sonar_linux_amd64.tar.gz"
      sha256 "43f416285cdef42a1bd7ba41e78973b529924affa3861cf5a8cf13d39f1d0ce6"
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
