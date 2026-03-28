class GitWt < Formula
  desc "Git custom command that enhances Git's native worktree functionality"
  homepage "https://github.com/ahmedelgabri/git-wt"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-amd64.tar.gz"
      sha256 "ddd2537f93b3bc9d3a69584c11d7f042db8b803408d8b5232b48f0c729ff3437"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-arm64.tar.gz"
      sha256 "f896d31f8df7f7dfa9eb6d1d6a469198160f983de585859c777bc978b3b11963"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-amd64.tar.gz"
      sha256 "31f1e047ecfaeb9ef8e02cbac2759e09cfc8b4ee87461f2702e5b6c1ed2e6739"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-arm64.tar.gz"
      sha256 "b4268ce8abb546916e4c6da705282f2aa26e78b507963b69cd7a1c58859f35e8"
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
