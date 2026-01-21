class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.8/pruner-macos-amd64"
      sha256 "49cdb8a9aa7d59c46c20f38103358ba753174494ba5d777810e131e73132ec63"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.8/pruner-macos-arm64"
      sha256 "529c714b95b09312da4ab2b7bdcd6ab36d80c17f6a040b415d0c372bfe2188be"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.8/pruner-linux-amd64"
      sha256 "a2ecff3b6344c3273e2cb4400b56ed25d803fdeddc3f1483557398b3a5d6562c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.8/pruner-linux-arm64"
      sha256 "307ebf1423bce7d6ad1da16c9c66a3297686adacf0930c949c8afa778014942a"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
