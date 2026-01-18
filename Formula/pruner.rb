class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.3/pruner-macos-amd64"
      sha256 "712d1b9e33ed077b85b6cfb0ea9a099f4c17893e88251593163e5b5dc8efaa26"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.3/pruner-macos-arm64"
      sha256 "712d1b9e33ed077b85b6cfb0ea9a099f4c17893e88251593163e5b5dc8efaa26"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.3/pruner-linux-amd64"
      sha256 "00875bfaa75cda44fa3fd2982b83f3ccbce2f6696263882fc4d8b3f20d5f0d0e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.3/pruner-linux-arm64"
      sha256 "044b4318f639867a15c1328ccf98da0c4af3c91205f1c75aaa2f16325f100698"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
