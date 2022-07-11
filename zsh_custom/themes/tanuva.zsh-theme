local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
PROMPT='${ret_status} %B%F{214}%n@%m %F{208}%~%f%b $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{214}(%F{196}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{214}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{214})%f"
