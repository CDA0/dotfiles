#
# Global Config
#
# http://joshldavis.com/2014/07/26/oh-my-zsh-is-a-disease-antigen-is-the-vaccine/
# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Ensure languages are set
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Ensure editor is set
export EDITOR=vim

# This fixes using SSH in urxvt
if [[ $TERM == 'rxvt-unicode'  ]] ; then
  if hash startx 2>& /dev/null; then
    startx && logout
  fi
fi

#
# Work specific config
#

# Use zsh-completions if it exists
if [[ -d "/usr/local/share/zsh-completions" ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Load Antigen
source ~/.antigen.zsh

#
# oh-my-zsh library
#

antigen use oh-my-zsh

#
# Bundles from the default repo (robbyrussel/oh-my-zsh)
#

antigen bundle git
antigen bundle tmuxinator
antigen bundle npm
antigen bundle ubuntu

#
# Antigen Bundles
#

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen bundle tarruda/zsh-autosuggestions
antigen bundle lukechilds/zsh-nvm
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle cswl/zsh-rbenv

#
# Antigen theme
#

antigen theme nanotech

antigen apply

#
# Nice aliases
#

alias ls="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Gl" # long list, excludes dot files
alias llh="ls -Glh" # long list, preety print size
alias lla="ls -Gla" # long list all, includes dot files

# alias vim="nvim"    # make vim nvim
alias rla="source ~/.zshrc"

alias genssh="ssh-keygen -o -a 100 -t ed25519"
alias mux="tmuxinator"
