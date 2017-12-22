alias ..='cd ..'
alias ....='cd ../..'

alias dotfiles='cd ~/.dotfiles'

alias h='history'

alias ls='ls -G'
alias la='ls -Ga'
alias ll='ls -Gl'
alias llh='ls -Glh'
alias lla='ls -Gla'

alias rla='. ~/.bashrc'

alias docker-less='docker ps | less -SEX'
alias docker-kill='docker kill $(docker ps -q)'
alias docker-rm='docker rm $(docker ps -a -q)'
alias docker-rmi='docker rmi $(docker images -q)'
alias docker-rmv='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dockers='docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}\\t{{.Command}}"'

alias nvmup='curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash'
alias npmE='PATH="$(npm bin)":"$PATH"'
alias npm='npm --no-shrinkwrap --no-git-tag-version'

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias gst='git status -sb'

alias ga='git add'
alias gapa='git add -p'

alias gco='git checkout'
alias gcm='git checkout master'

alias gc='git commit'

alias gp='git push'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias gf='git fetch'
alias gl='git pull'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'

alias gm='git merge'
alias gmom='git merge origin/master'

alias gd='git diff'
alias gdca='git diff --cached'

alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstc='git stash clear'
alias gstl='git stash list'
alias gsts='git stash show --text'

alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias gloga='git log --oneline --decorate --graph --all'

