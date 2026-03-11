class Cdi < Formula
  desc "Quick directory navigation with numeric indices"
  homepage "https://github.com/ltgiant/cdi"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-aarch64-apple-darwin.tar.gz"
      sha256 "ec4873098edbafd38d8e175ea5f43c2f3261e6983de4be6eb88073ded1108206"
    else
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-apple-darwin.tar.gz"
      sha256 "ec1c3519a620b243f4a28bfbbc8488b06bc33da3076635b8d2f8785180cfdef5"
    end
  end

  on_linux do
    url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c92080eb6611062daa723a91372a062b1f1b00170d74156072377ce438d2826"
  end

  def install
    bin.install "cdi"
  end

  def caveats
    <<~EOS
      Add the following to your shell config:

        Zsh (~/.zshrc):   eval "$(cdi init zsh)"
        Bash (~/.bashrc): eval "$(cdi init bash)"
        Fish:             cdi init fish | source
    EOS
  end

  test do
    assert_match "cdi #{version}", shell_output("#{bin}/cdi --version")
  end
end
