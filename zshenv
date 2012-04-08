# .zshenv is being sourced in every zsh session, while .zshrc is only used in interactive sessions

[[ -s "/Users/matee/.rvm/scripts/rvm" ]] && source "/Users/matee/.rvm/scripts/rvm"


export PATH=~/bin:$PATH
export PATH=$PATH:~/.rvm/gems/ruby-1.9.3-p125-perf/bin
export PATH=$PATH:~/.rvm/gems/ruby-1.9.3-p125-perf@global/bin
export PATH=$PATH:~/.rvm/rubies/ruby-1.9.3-p125-perf/bin
export PATH=$PATH:~/.rvm/bin
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/libexec


PROJECT_PREFIX="~/Developer/Projects"
WORK_PROJECT_PREFIX="$PROJECT_PREFIX/Work"
export PYTHONPATH=$PYTHONPATH:/Users/matee/Developer/Projects/Work/


# Git-achievements
# export PATH=$PROJECT_PREFIX/git-achievements/:$PATH
# alias git="git-achievements"


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
alias django_settings_module="PWD=`pwd`; export DJANGO_SETTINGS_MODULE=`basename $PWD`.settings; echo $DJANGO_SETTINGS_MODULE"

# Repositories
alias gm="cd $WORK_PROJECT_PREFIX/getmedia; pypath; django_settings_module; activate"
alias gg='cd $WORK_PROJECT_PREFIX/greengate; pypath; activate'
alias mz="cd $WORK_PROJECT_PREFIX/muzomedia"
alias dotfiles="cd $PROJECT_PREFIX/Private/dotfiles"
alias qilex="cd $WORK_PROJECT_PREFIX/qilex-users"
alias skaner='cd $WORK_PROJECT_PREFIX/rlb/cmswebservice/cmswebservice/suds/'


alias projects="cd $PROJECT_PREFIX"
alias repos="cd $PROJECT_PREFIX"

#alias nose="nosetests --with-growl --with-achievements"
#alias prawko='curl -s --data "pesel=PESEL&imie=IMIE&nazwisko=NAZWISKO" https://www.kierowca.pwpw.pl/PJAction.do|grep "<P><B>"'


if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Tuning ruby: https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
