#
# Global Config
#
# module_path=($module_path /usr/local/lib/zpython)
# http://joshldavis.com/2014/07/26/oh-my-zsh-is-a-disease-antigen-is-the-vaccine/
# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Ensure languages are set
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Ensure editor is set
export EDITOR=nvim

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k


# This fixes using SSH in urxvt
if [[ $TERM == 'rxvt-unicode'  ]] ; then
  if hash startx 2>& /dev/null; then
    startx && logout
  fi
fi

#
# Work specific config
#
if [[ -f ~/.zsh-local ]]; then
  source ~/.zsh-local
fi

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

export KEYTIMEOUT=1
antigen bundle robbyrussell/oh-my-zsh plugins/vi-mode
antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle robbyrussell/oh-my-zsh plugins/npm
antigen bundle robbyrussell/oh-my-zsh plugins/command-not-found

#
# Antigen Bundles
#

# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-completions src
export NVM_AUTO_USE=true
export NVM_NO_USE=true
antigen bundle lukechilds/zsh-nvm
# antigen bundle cswl/zsh-rbenv

#
# Antigen theme
#

antigen theme bhilburn/powerlevel9k powerlevel9k
# antigen theme robbyrussell/oh-my-zsh themes/flazz
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen apply

#
# Nice aliases
#

alias dotfiles="cd ~/.dotfiles"

alias ls="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Gl" # long list, excludes dot files
alias llh="ls -Glh" # long list, preety print size
alias lla="ls -Gla" # long list all, includes dot files

alias rla="source ~/.zshrc"
alias ezr="$EDITOR ~/.zshrc"

alias antup="curl -L git.io/antigen > ~/.antigen.zsh"

alias genssh="ssh-keygen -o -a 100 -t ed25519"

alias docker-less='docker ps | less -SEX'
alias docker-kill='docker kill $(docker ps -q)'
alias docker-rm='docker rm $(docker ps -a -q)'
alias docker-rmi='docker rmi $(docker images -q)'
alias docker-rmv='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dockers='docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}\\t{{.Command}}"'
