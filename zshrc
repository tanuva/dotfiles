alias ll="ls -lh"
# Fix colors in tig after ~/.terminfo for fixing tmux broke them
alias tig="TERM=xterm-256color tig"
alias vscode="open -a /Applications/Visual\ Studio\ Code.app"
alias fdg="fd -g"

alias gc="git commit"
alias gcp="git cherry-pick"
alias gf="git fetch"
alias gl="git pull"
alias gp="git push"
alias gpdev="git push gerrit HEAD:refs/for/dev"
alias gpforce="git push --force-with-lease --force-if-includes"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias gst="git status"
alias gsta="git stash apply"
alias gstp="git stash pop"

# Put arm64 homebrew before x64 homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/bin
# Created by `pipx` on 2024-02-09 12:48:52
export PATH="$PATH:~/.local/bin"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#export LESS="-N"
#export SQUISH_USE_SWT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

eval $(oh-my-posh init zsh --config ~/.dotfiles/omp/feirge.omp.json)

# Signing with gpg fails with something about ioctls without this
export GPG_TTY=$(tty)

if [ -e /opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight ]; then
    export GIT_PAGER="/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less"
fi

if [ -e /opt/homebrew/bin/hx ] || [ -e /usr/bin/hx ]; then
    export VISUAL=hx
    export EDITOR=$VISUAL
fi
