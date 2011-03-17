# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

# get the name of the branch we are on 
git_prompt_info() { 
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return 
  echo "(${ref#refs/heads/})" 
}

autoload -U colors 
colors 
setopt prompt_subst 
PROMPT='%{$fg_bold[green]%}%n %{$fg[blue]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%} %% %{$reset_color%}'

# bindkey '^[[H'  beginning-of-line       # Home
# bindkey '^[[F'  end-of-line             # End
# bindkey "^r" history-incremental-search-backward

