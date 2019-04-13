# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Poetry < Formula
  desc "Python dependency management and packaging made easy."
  homepage "https://poetry.eustace.io"
  url "https://github.com/sdispater/poetry/archive/0.12.12.tar.gz"
  sha256 "34b9ae5d897bbfb65742710994a6106bebe9d2a78604e65c63413ddacecbc791"
  
  depends_on "python"

  def install
    ENV["POETRY_HOME"] = prefix
    system "python3", "get-poetry.py", "--accept_all", "--modify_path=False"
  end

  def caveats; <<~EOS
    To Enable tab completion for Bash, Fish, or Zsh:
      # Bash
      poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
      
      # Bash (macOS/Homebrew)
      poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion
      
      # Fish
      poetry completions fish > ~/.config/fish/completions/poetry.fish
      
      # Zsh
      poetry completions zsh > ~/.zfunc/_poetry
    Note: you may need to restart your shell in order for the changes to take effect.

    For zsh, you must then add the following line in your ~/.zshrc before compinit:
      fpath+=~/.zfunc
  EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test poetry`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end

end
