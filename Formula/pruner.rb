class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.7/pruner-macos-amd64"
      sha256 "ba42826bd4f57281479a205db12ca839f46d27edfb0e7d2b241ad2335553be1c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.7/pruner-macos-arm64"
      sha256 "de9b0a705f0bc1dde246dbb49ca13e7c4fc5e8285a5d48db3c6d2d64cd47d8d2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.7/pruner-linux-amd64"
      sha256 "86df5fd5c942b9243f28761fe4bf3450135c388ff0a973573417d5492612da2a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.7/pruner-linux-arm64"
      sha256 "1257461cf90357e23af371883ebae8bb9c1c0ca4abcd1fd935fc20f40ae2e889"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
