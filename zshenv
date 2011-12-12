# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

#if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi
[[ -s "/Users/matee/.rvm/scripts/rvm" ]] && source "/Users/matee/.rvm/scripts/rvm"


if [[ $HOST == "prosiak" ]]; then
  PROJECT_PREFIX="~/Developer/Projects"
  WORK_PROJECT_PREFIX="$PROJECT_PREFIX/redefine"
  export PYTHONPATH=$PYTHONPATH:/Users/matee/Developer/Projects/redefine/
else
  PROJECT_PREFIX="/home/matee/repos"
  WORK_PROJECT_PREFIX=$PROJECT_PREFIX
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

# Useful commands
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias netapps="lsof -P -i -n | cut -f 1 -d ' ' | uniq"
alias mirror-site="wget -L -r -k -p -m"
alias -g ND='$(ls -d *(/om[1]))'    # newest directory
alias -g NF='$(ls *(.om[1]))'       # newest file

# Virtualenv + Python
alias activate="source bin/activate"
alias pypath="export PYTHONPATH=.:.."
alias django_settings_module="PWD=`pwd`; export DJANGO_SETTINGS_MODULE=`basename $PWD`.settings"

# Repositories
alias gm="cd $WORK_PROJECT_PREFIX/getmedia; pypath; django_settings_module; activate"
alias gg='cd $WORK_PROJECT_PREFIX/greengate; pypath; activate'
alias mz="cd $WORK_PROJECT_PREFIX/muzomedia"
alias dotfiles="cd $PROJECT_PREFIX/Private/dotfiles"
alias qilex="cd $WORK_PROJECT_PREFIX/qilex-users"
alias skaner='cd $WORK_PROJECT_PREFIX/rlb/cmswebservice/cmswebservice/suds/'


alias projects="cd $PROJECT_PREFIX"
alias repos="cd $PROJECT_PREFIX"

alias edi="cd $PROJECT_PREFIX/Private/eDi"

#alias nose="nosetests --with-growl --with-achievements"
#alias prawko='curl -s --data "pesel=PESEL&imie=IMIE&nazwisko=NAZWISKO" https://www.kierowca.pwpw.pl/PJAction.do|grep "<P><B>"'



if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi
