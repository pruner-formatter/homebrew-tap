class Pruner < Formula
  desc "Code formatter orchestrator built with Treesitter"
  homepage "https://github.com/pruner-formatter/pruner"
  license "MIT"
  version "1.0.0-alpha.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.10/pruner-macos-amd64"
      sha256 "3cdbcc9955b742f6778466ace748d694ca63d2e994da5ae147aed99dceaf6b67"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.10/pruner-macos-arm64"
      sha256 "77649ba9e753dd694fca95696f5a348169645534ff56578293efdfcd6e837674"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.10/pruner-linux-amd64"
      sha256 "4e6384b67ccc02184ca372ee358da4b53178ef41b1484024703640fc4cd01437"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pruner-formatter/pruner/releases/download/v1.0.0-alpha.10/pruner-linux-arm64"
      sha256 "5929fcbcc3fbbdfc28002f1995ac20f59204a16ed71d5417b9b17eefaf55180f"
    end
  end

  def install
    bin.install Dir["pruner-*"].first => "pruner"
  end
end
