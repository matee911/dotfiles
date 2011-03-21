# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi

alias -g ND='$(ls -d *(/om[1]))'    # newest directory
alias -g NF='$(ls *(.om[1]))'       # newest file

alias srv='script/server'           # run rails server

if [[ $HOST == "prosiak" ]]; then
  PROJECT_PREFIX="~/Developer/Projects"
else
  PROJECT_PREFIX="~/repos"
fi


alias gg='cd $PROJECT_PREFIX/redefine/greengate'
alias skaner='cd $PROJECT_PREFIX/redefine/rlb/cmswebservice/cmswebservice/suds/'
alias projects="cd $PROJECT_PREFIX"
alias repos="cd $PROJECT_PREFIX"
alias gm="cd $PROJECT_PREFIX/getmedia"

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias netapps="lsof -P -i -n | cut -f 1 -d ' ' | uniq"
alias mirror-site="wget -L -r -k -p -m"

#alias nose="nosetests --with-growl --with-achievements"
#alias prawko='curl -s --data "pesel=PESEL&imie=IMIE&nazwisko=NAZWISKO" https://www.kierowca.pwpw.pl/PJAction.do|grep "<P><B>"'

