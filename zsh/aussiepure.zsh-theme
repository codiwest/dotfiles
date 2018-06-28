
PROMPT='$fg[red]%n$fg[yellow] on $fg[magenta]%m $fg[yellow]in $fg[blue]%~ $(git_prompt_info) $fg[yellow]$(rvm_prompt_info)$reset_color
❯ '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[green]("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"
