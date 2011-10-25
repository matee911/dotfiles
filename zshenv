# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

#if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi
[[ -s "/Users/matee/.rvm/scripts/rvm" ]] && source "/Users/matee/.rvm/scripts/rvm"

alias -g ND='$(ls -d *(/om[1]))'    # newest directory
alias -g NF='$(ls *(.om[1]))'       # newest file

alias srv='script/server'           # run rails server

if [[ $HOST == "prosiak" ]]; then
  PROJECT_PREFIX="~/Developer/Projects"
  export PYTHONPATH=$PYTHONPATH:/Users/matee/Developer/Projects/redefine/
else
  PROJECT_PREFIX="/home/matee/repos"
  export PYTHONPATH=/home/matee/repos/:$PYTHONPATH
fi

# Git-achievements
export PATH=$PROJECT_PREFIX/git-achievements/:$PATH
alias git="git-achievements"


# Bazaar alias
alias bdi="bzr cdiff"
alias bup="bzr up"
alias bci="bzr ci"
alias bst="bzr st -S"
alias btip="bzr log -l 1 -v --include-merges"

# Git alias
alias gdi="git diff"
alias gci="git commit -a"
alias gst="git status -s"
alias gup="git pull"


alias gg='cd $PROJECT_PREFIX/redefine/greengate'
alias skaner='cd $PROJECT_PREFIX/redefine/rlb/cmswebservice/cmswebservice/suds/'
alias projects="cd $PROJECT_PREFIX"
alias repos="cd $PROJECT_PREFIX"
alias gm="cd $PROJECT_PREFIX/getmedia"
alias mz="cd $PROJECT_PREFIX/muzomedia"

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias netapps="lsof -P -i -n | cut -f 1 -d ' ' | uniq"
alias mirror-site="wget -L -r -k -p -m"

#alias nose="nosetests --with-growl --with-achievements"
#alias prawko='curl -s --data "pesel=PESEL&imie=IMIE&nazwisko=NAZWISKO" https://www.kierowca.pwpw.pl/PJAction.do|grep "<P><B>"'

