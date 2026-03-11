class Cdi < Formula
  desc "Quick directory navigation with numeric indices"
  homepage "https://github.com/ltgiant/cdi"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-aarch64-apple-darwin.tar.gz"
      sha256 "ab993927336b204372c06671516cc392439f700f6fa2ffaab6d751f1875f2155"
    else
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-apple-darwin.tar.gz"
      sha256 "e14ce3d6772c73f4baaa17b435cc83a09749352832e9d3085df8628bd8ed0cf9"
    end
  end

  on_linux do
    url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61d8d302dab3fa060a6a45f3e59ba2c8ffebcebdd79f07c26414eae35a8c28d5"
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
