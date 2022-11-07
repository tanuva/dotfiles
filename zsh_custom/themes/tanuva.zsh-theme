local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %F{214}%n@%m %F{208}%~%f $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{214}(%F{196}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{214}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{214})%f"
