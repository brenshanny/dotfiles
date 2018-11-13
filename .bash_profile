PS1="\[\033[35m\]\t\[\033[m\]||\[\033[32m\]\w\[\033[m\]\$ "
export PATH="$HOME/.cargo/bin:$PATH"
# source ~/bin/virtualenvwrapper.sh
# export JAVA_HOME="/usr/bin/java"
export PATH="$PATH:/Users/brendanshanny/java/apache-maven-3.5.3/bin/"


#--- PERSONAL
alias editprofile="vi ~/.bash_profile"
alias resource="echo Well then, there ya go... && source ~/.bash_profile"
export DEFAULT_USER="brendanshanny"
if [ "$($COMP_ENV)" == "securedocs" ]; then
  eval "$(rbenv init -)"
fi
if [ -d /Applications/MacVim.app/Contents ]; then
  alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias vi='vim'
fi



#--- SecureDocs
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future
export PATH="/opt/chefdk/bin:$PATH"
export PATH="/Users/brendanshanny/SecureDocs/dev-utils/bin:$PATH"
alias vash="cd ~/SecureDocs/ && vagrant ssh"
alias cdvdr="cd ~/SecureDocs/source/vdr-app/"
alias cdsso="cd ~/SecureDocs/source/sso-app/"
alias switch_vdr="cd ~/SecureDocs/ && devapp.sh vdr2 && vagrant up"
alias switch_admin="cd ~/SecureDocs/ && devapp.sh billing && vagrant up"
alias rmnode="rm -rf ~/Securedocs/source/vdr-app/node_modules"
alias comboup="cdvdr && ./bin/combo run --service-ports combo bash"
alias combodown="cdvdr && ./bin/combo down && clean_docker_shit"
alias comboreset="combodown && comboup"
alias clean_docker_shit="docker volume ls -qf dangling=true | xargs docker volume rm"

function aws_login() {
  $(aws ecr get-login --region us-east-1 --no-include-email)
}


#--- git
alias gst="git st"
alias gco="git co"
alias gb="git b -v"
alias stashl="git stash list"
alias stash="git stash save"
alias fixgpg="export GPG_TTY=${tty}"
alias rebase="echo Fetching...; git fetch; echo Done; echo Rebasing...; git rebase; echo Done;"
function stashp() {
  git stash pop stash@{$1}
}
function stashd() {
  git stash drop stash@{$1}
}
if [ "$(uname -s)" == "Darwin" ]; then
  source ~/.git-completion.bash
fi
export GPG_TTY=${tty}

#--- docker-sync checker
export DOCKER_SYNC_CHECKER="/Users/brendanshanny/SecureDocs/source/vdr-app/docker-sync-checker.txt"
export DOCKER_SYNC_LOG="/Users/brendanshanny/SecureDocs/source/vdr-app/.docker-sync/daemon.log"

#--- tmux
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias tls="tmux ls"

#--- python
export PATH="/Users/brendanshanny/bin/:$PATH"
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
