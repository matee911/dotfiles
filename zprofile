# Path
# export PATH=/opt/local/bin:$PATH
# export PATH=/opt/local/sbin:$PATH
# export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH
# export PATH=/usr/local/mysql/bin:$PATH
# export PATH=/opt/local/lib/rabbitmq/bin:$PATH
# export PATH=/Users/matee/Developer/Sources/go/bin:$PATH
# export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH

# Diameter
# export PATH=/opt/local/lib/erlang/lib/diameter-0.10/bin:$PATH

# Manpath
# export MANPATH=/opt/local/share/man:$MANPATH

#
# export PYTHONSTARTUP=~/.pythonrc
# export PYTHONPATH=$PYTHONPATH:/Users/matee/Developer/Projects/redefine
# export PATH=/Users/matee/Developer/Sources/git-achievements:$PATH

# alias git='git-achievements'

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

