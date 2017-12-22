set -o vi

[ -f /usr/local/etc/bash_completion  ] && . /usr/local/etc/bash_completion

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W$(__git_ps1 " (%s)") \$\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;36m\]$(__git_ps1 " (%s)") \$\[\033[00m\] '
fi

export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
