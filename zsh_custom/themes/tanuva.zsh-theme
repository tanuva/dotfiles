# These colours are selected to look good with my terminal background,
# have decent contrast to the rest of the prompt, look good with white
# text, and not look too alarming (no strong reds).
# Also they spark joy.
READABLE_COLOURS=(12 18 23 24 29 30 35 36 37 38 43 54 59 67 71 72 73 74 79 90 97 103 107 108 109 125 132 133 138 140 145 168 169 203 205 209 211 241 244 245 246 248)
COLOUR_AMOUNT=${#READABLE_COLOURS[@]}

# we hash username@hostname, then mod it by the colour count
if command -v sha1sum &> /dev/null; then
    # Guess we're on Linux
    HOST_STRING=$(whoami)@$(hostnamectl hostname)
    HOST_STRING_HASH=$(( 0x$(echo $HOST_STRING | sha1sum | cut -d ' ' -f 1 | head -c 10) ))
elif command -v shasum &> /dev/null; then
    # macOS, probably
    HOST_STRING=$(whoami)@$(hostname)
    HOST_STRING_HASH=$(( 0x$(echo $HOST_STRING | shasum - | cut -d ' ' -f 1 | head -c 10) ))
fi

HOST_COLOUR_INDEX=$(($HOST_STRING_HASH % $COLOUR_AMOUNT))
HOST_COLOUR_INDEX=$((HOST_COLOUR_INDEX+1)) # increase by one as zsh arrays start at 1

#HOST_COLOUR=24
HOST_COLOUR=${READABLE_COLOURS[$HOST_COLOUR_INDEX]}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
PROMPT='${ret_status} %B%F{$HOST_COLOUR%}%n@%m %F{208}%~%f%b $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{214}(%F{196}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{214}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{214})%f"
