class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.6/pruner-macos-amd64"
      sha256 "60e77c7ae22c7d49905cc1862611acb2e8f2eb4d1efeb940cf8029e6d03698af"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.6/pruner-macos-arm64"
      sha256 "0fba2f43e9d8c3400dcdc59d35013a5c2242e9d48e1729b6b5176f0bb59aac5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.6/pruner-linux-amd64"
      sha256 "5682d23f9467308ea08da90231aee8d531ee34fac86d0659c5f6890dd8b94daf"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.6/pruner-linux-arm64"
      sha256 "6ee14ade55329e1c678e68fa5121b75399a2574786b403725cac82e1be8fbf31"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
