# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tanuva"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gopath='export GOPATH=$GOPATH:`pwd`'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git macos python rust)

source $ZSH/oh-my-zsh.sh

alias ll="ls -lh"
# Fix colors in tig after ~/.terminfo for fixing tmux broke them
alias tig="TERM=xterm-256color tig"
alias gpdev="git push gerrit HEAD:refs/for/dev"
alias gcp="git cherry-pick"
alias vscode="open -a /Applications/Visual\ Studio\ Code.app"

# Put arm64 homebrew before x64 homebrew
export PATH=/opt/homebrew/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#export LESS="-N"
#export SQUISH_USE_SWT=1

# Signing with gpg fails with something about ioctls without this
export GPG_TTY=$(tty)

if [ -e /opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight ]; then
    export GIT_PAGER="/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less"
fi

if [ -e /opt/homebrew/bin/hx ] || [ -e /usr/bin/hx ]; then
    export VISUAL=hx
    export EDITOR=$VISUAL
fi

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    alias nix-shell="nix-shell --command 'zsh'"
fi
