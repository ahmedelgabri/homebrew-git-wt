class GitWt < Formula
  desc "Git custom command that enhances Git's native worktree functionality"
  homepage "https://github.com/ahmedelgabri/git-wt"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-amd64.tar.gz"
      sha256 "08bb99143bbc5c5635a1931df3b0ce3e9f7d49242f9b3f55dd6d311e3a1db2f3"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-arm64.tar.gz"
      sha256 "b71d37442ef59eb7d5e006bd24236cb2b3fb5c48f048d446562fb37eaa361d3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-amd64.tar.gz"
      sha256 "1c3268e314f7a2cc9e978f686dbbb7799871e60968444be65ee2bcc3b6eb6d05"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-arm64.tar.gz"
      sha256 "5183de4ec246f9d001758ecf6562098faa685b47333c2583fee505324d7dfe9a"
    end
  end

  depends_on "git"

  def install
    bin.install "git-wt"
    bash_completion.install "completions/git-wt.bash" => "git-wt"
    zsh_completion.install "completions/_git-wt"
    fish_completion.install "completions/git-wt.fish"
    man1.install Dir["man/*.1"]
  end

  test do
    system bin/"git-wt", "--help"
  end
end
