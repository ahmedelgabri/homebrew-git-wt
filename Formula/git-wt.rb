class GitWt < Formula
  desc "Git custom command that enhances Git's native worktree functionality"
  homepage "https://github.com/ahmedelgabri/git-wt"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-amd64.tar.gz"
      sha256 "c4a5d943e6b6089694912d3aa32c3f489b2f47f21772d40db9b23cdee366ac1b"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-darwin-arm64.tar.gz"
      sha256 "6399f577a57568a64b70ca90def85e4d8eb42b9684e8b65125578e2b2625205c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-amd64.tar.gz"
      sha256 "abef6b580da4570f966d782c22303792745253a7356997273cf77622588cc0c3"
    end

    on_arm do
      url "https://github.com/ahmedelgabri/git-wt/releases/download/v#{version}/git-wt-#{version}-linux-arm64.tar.gz"
      sha256 "4e3a2f3ba3032f4610ef883e0f7f3251f7a8406c7bcd2fcae914fe7a480826d5"
    end
  end

  depends_on "git"

  def install
    bin.install "git-wt"
    bash_completion.install "completions/git-wt.bash" => "git-wt"
    zsh_completion.install "completions/_git-wt"
    zsh_completion.install "completions/_git_wt"
    fish_completion.install "completions/git-wt.fish"
    man1.install Dir["man/*.1"]
  end

  test do
    system bin/"git-wt", "--help"
  end
end
