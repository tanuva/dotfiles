local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %B%F{34}%n@%m %F{28}%~%f%b $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{34}(%F{25}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{34}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{34})"
