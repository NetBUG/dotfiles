autoload -U colors && colors
autoload -U add-zsh-hook

parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null | sed -E 's/(.+)/ (\1)/g'
}
setopt PROMPT_SUBST

update_prompt() {
    PS1="%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$fg_bold[magenta]%}$(parse_git_branch)%  %{$fg[yellow]%}%~ %{$reset_color%}%% "
}

add-zsh-hook chpwd update_prompt
update_prompt
