class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.9/pruner-macos-amd64"
      sha256 "776d9debe47312f652a4fdee19b050f8b5fcdbfbcbfeb120fee40cfef9d709ed"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.9/pruner-macos-arm64"
      sha256 "5ed60c32da8dce3bcd7c417369f07e1ddd9f641ef30bb93b31fd82d0b7cae4f7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.9/pruner-linux-amd64"
      sha256 "93968d8a9b507e3c85ee1ae6b7dcf9d4eb8ebde2e47340e8f0a32862f70864d0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.9/pruner-linux-arm64"
      sha256 "ea224f83008d585a6e7740a957a2e0f4f55faae7c98e0897c7ae41d18104d1fc"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
