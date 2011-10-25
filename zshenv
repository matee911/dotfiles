# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

#if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi
[[ -s "/Users/matee/.rvm/scripts/rvm" ]] && source "/Users/matee/.rvm/scripts/rvm"

alias -g ND='$(ls -d *(/om[1]))'    # newest directory
alias -g NF='$(ls *(.om[1]))'       # newest file

alias srv='script/server'           # run rails server

alias praca='cd ~/Developer/Projects/redefine/praca'
alias moben='cd ~/Developer/Projects/moben'
alias voter='cd ~/Developer/Projects/voter'
alias gg='cd ~/Developer/Projects/redefine/greengate'
alias skaner='cd ~/Developer/Projects/redefine/rlb/cmswebservice/cmswebservice/suds/'
alias projects="cd ~/Developer/Projects/"
alias gm="cd ~/Developer/Projects/redefine/getmedia/"
alias ezo="cd ~/Developer/Projects/ezoteryka"

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias netapps="lsof -P -i -n | cut -f 1 -d ' ' | uniq"
alias mirror-site="wget -L -r -k -p -m"

#alias nose="nosetests --with-growl --with-achievements"
#alias prawko='curl -s --data "pesel=PESEL&imie=IMIE&nazwisko=NAZWISKO" https://www.kierowca.pwpw.pl/PJAction.do|grep "<P><B>"'

