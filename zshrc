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

export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH
export PATH=/Applications/Arduino.app/Contents/Resources/Java/hardware/tools/avr/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar/pyqt/4.9.4/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/play/2.0.4/bin
export PATH=$PATH:/usr/local/Cellar/gettext/0.18.1.1/bin
export PATH=$PATH:/usr/local/heroku/bin
alias trybuy="git checkout trybuy && git push origin trybuy && git checkout staging && git merge trybuy && git push origin staging && ./staging.sh send_pack select_pack && git checkout trybuy"
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/closure-compiler/20130227/libexec/build/

alias pipoutdated='pip freeze -l|cut -d "=" -f 1|sort -f|xargs pip search -v|grep "INSTALLED:" -B 1 -A 1|grep -i "latest" -B 2|grep -vE "^\-\-"'
alias got='go'

