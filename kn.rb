require "fileutils"

class Kn < Formula
  homepage "https://github.com/knative/client"

  v = "knative-v1.8.0"
  version v

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/knative/client/releases/download/#{v}/kn-darwin-amd64"
    sha256 "0db19ab608dfb7b0efc7c3032f5f683f79217ebd479ae4ea993893afa57090f9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/knative/client/releases/download/#{v}/kn-darwin-arm64"
    sha256 "18f89dd8eeae9aac9113ee443c4faf3bcb525018f7adb09143db9e9e3d8d7940"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/knative/client/releases/download/#{v}/kn-linux-arm64"
    sha256 "a7df883ac04811212beb4f7eed02bfb93161c591d29c704450711acd9f05284f"
  else
    url "https://github.com/knative/client/releases/download/#{v}/kn-linux-amd64"
    sha256 "943b096b549f2580d72b0b59a571eb0654822c7c47784345dc24d1b820bca149"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      FileUtils.mv("kn-darwin-amd64", "kn")
    elsif OS.mac? && Hardware::CPU.arm?
      FileUtils.mv("kn-darwin-arm64", "kn")
    elsif OS.linux? && Hardware::CPU.arm?
      FileUtils.mv("kn-linux-arm64", "kn")
    else
      FileUtils.mv("kn-linux-amd64", "kn")
    end
    bin.install "kn"
  end

  test do
    system "#{bin}/kn", "version"
  end
end
