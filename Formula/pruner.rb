class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.5/pruner-macos-amd64"
      sha256 "359362644b89bf78139282fa71020cb2c9f0b9b154bda92c258061ee6e682941"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.5/pruner-macos-arm64"
      sha256 "359362644b89bf78139282fa71020cb2c9f0b9b154bda92c258061ee6e682941"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.5/pruner-linux-amd64"
      sha256 "bd843620471d41c9de7e156307b71609c73c42030d5578589602d2398e6c55bf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.5/pruner-linux-arm64"
      sha256 "9fef43c9babf9135cf4e6912603135378695ddd38bc403cd6b43a7f28a074d35"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
