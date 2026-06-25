# oh-my-zsh setup
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="feirge"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom
plugins=(git macos python rust colored-man-pages)
source $ZSH/oh-my-zsh.sh

alias ll="ls -lh"
# Fix colors in tig after ~/.terminfo for fixing tmux broke them
#alias tig="TERM=xterm-256color tig"
alias vscode="open -a /Applications/Visual\ Studio\ Code.app"
alias fdg="fd -g"

alias gpdev="git push gerrit HEAD:refs/for/dev"
alias gpforce="git push --force-with-lease --force-if-includes"

# Put arm64 homebrew before x64 homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/bin
# Created by `pipx` on 2024-02-09 12:48:52
export PATH="$PATH:~/.local/bin"

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#export LESS="-N"
#export SQUISH_USE_SWT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Signing with gpg fails with something about ioctls without this
export GPG_TTY=$(tty)

if [ -e /opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight ]; then
    export GIT_PAGER="/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less"
fi

if [ -e /opt/homebrew/bin/hx ] || [ -e /usr/bin/hx ]; then
    export VISUAL=hx
    export EDITOR=$VISUAL
fi
