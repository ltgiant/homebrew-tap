class Cdi < Formula
  desc "Quick directory navigation with numeric indices"
  homepage "https://github.com/ltgiant/cdi"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-aarch64-apple-darwin.tar.gz"
      # sha256 will be updated after first release
    else
      url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-apple-darwin.tar.gz"
      # sha256 will be updated after first release
    end
  end

  on_linux do
    url "https://github.com/ltgiant/cdi/releases/download/v#{version}/cdi-x86_64-unknown-linux-gnu.tar.gz"
    # sha256 will be updated after first release
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
