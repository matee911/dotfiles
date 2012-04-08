#
# .zshenv is being sourced in every zsh session, 
# while .zshrc is only used in interactive sessions
#

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh


# get the name of the branch we are on 
git_prompt_info() { 
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return 
  echo "(${ref#refs/heads/})" 
}

autoload -U colors 
colors 
setopt prompt_subst 
PROMPT='%{$fg_bold[green]%}%n %{$fg[blue]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%} %% %{$reset_color%}'

# bindkey '^[[H'  begining-of-line       # Home
# bindkey '^[[F'  end-of-line             # End
# bindkey "^r" history-incremental-search-backward

