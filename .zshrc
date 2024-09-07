autoload -U colors && colors
autoload -U add-zsh-hook

parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null | sed -E 's/(.+)/ (\1)/g'
}
setopt PROMPT_SUBST

update_prompt() {
    PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$fg[blue]%}$(parse_git_branch)%  %{$fg[yellow]%}%~ %{$reset_color%}%% "
}

add-zsh-hook chpwd update_prompt
update_prompt
