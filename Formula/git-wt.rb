class GitWt < Formula
  desc "Git custom command that enhances Git's native worktree functionality"
  homepage "https://github.com/ahmedelgabri/git-wt"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-amd64.tar.gz"
      sha256 "8fe917b12f6af35487f8c2416b53836faa39ada0223ae8ff9869c8fbe5e760e0"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-arm64.tar.gz"
      sha256 "0ea62fe45337cb52c63a6ba7c5664057a39ab215646e3ced482730263833cb3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-amd64.tar.gz"
      sha256 "bab4946b120db65d6b9dfb2f57c628e76ec5c0646f3cf47c46e38b13f15d4cc1"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-arm64.tar.gz"
      sha256 "a1355731af00bd002803ec9f1ad22b8a14a91130d25ae71a3b8e83925429592f"
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
