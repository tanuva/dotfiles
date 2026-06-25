# These colours are selected to look good with my terminal background,
# have decent contrast to the rest of the prompt, look good with white
# text, and not look too alarming (no strong reds).
# Also they spark joy.
#READABLE_COLOURS=(12 18 23 24 29 30 35 36 37 38 43 54 59 67 71 72 73 74 79 90 97 103 107 108 109 125 132 133 138 140 145 168 169 203 205 209 211 241 244 245 246 248)
READABLE_COLOURS=("#f0e68c" "#e0ffff" "#d3ffce" "#ffdab9" "#fffacd" "#c8e6c9" "#ffe4e1" "#e6e6fa" "#f5deb3")
COLOUR_AMOUNT=${#READABLE_COLOURS[@]}

# we hash username@hostname, then mod it by the colour count
if [[ $(uname -s) == Linux ]]; then
    # Guess we're on Linux
    HOST_STRING=$(whoami)@$(hostnamectl hostname)
    HOST_STRING_HASH=$(( 0x$(echo $HOST_STRING | sha1sum | cut -d ' ' -f 1 | head -c 10) ))
elif [[ $(uname -s) == Darwin ]]; then
    # macOS, probably
    HOST_STRING=$(whoami)@$(hostname)
    HOST_STRING_HASH=$(( 0x$(echo $HOST_STRING | shasum - | cut -d ' ' -f 1 | head -c 10) ))
fi

HOST_COLOUR_INDEX=$(($HOST_STRING_HASH % $COLOUR_AMOUNT))
HOST_COLOUR_INDEX=$((HOST_COLOUR_INDEX+1)) # increase by one as zsh arrays start at 1

local HOST_FG=#fff
local HOST_FG=${READABLE_COLOURS[$HOST_COLOUR_INDEX]}
local HOST_BG=#5d4f70
local PATH_BG=#c2acf2
local GIT_BG=#5d4f70

PROMPT="%{%B%F{$HOST_BG}%}"$'\ue0b6'"%{%K{$HOST_BG}%F{$HOST_FG}%}%n@%m %{%F{$HOST_BG}%K{$PATH_BG}%}"$'\ue0b0'" %{%F{#000}%}%~ %{%F{$PATH_BG}%K{$GIT_BG}%}"$'\ue0b0'
PROMPT+='$(git_prompt_info)'
PROMPT+="%{%F{$GIT_BG}%k%}"$'\ue0b0'"
%{%(?:%F{$HOST_FG}:%F{#f04})%B%}❯%{%b%f%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{%F{#fff}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{#fff}%B%}✗%{%b%f%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
