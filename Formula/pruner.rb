class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.12/pruner-macos-amd64"
      sha256 "54ff9ab906ff25d6cf92c154362728813b93feef3e4592740502c48b571febf4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.12/pruner-macos-arm64"
      sha256 "5eb9c70497d8891ae246aa960d714fced72e311796aaf2d5a5a24158c9edbfd6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.12/pruner-linux-amd64"
      sha256 "d1f8e16dd5f2c37ea75083f3f552047292b2d0100f458fef0a8d0f9802406c07"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.12/pruner-linux-arm64"
      sha256 "2cb66797df293d98015b11a691127e4089f27fa0a9054742d9a31507691e2c36"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
