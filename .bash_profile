PS1="\[\033[35m\]\t\[\033[m\]||\[\033[32m\]\w\[\033[m\]\$ "
HOST_OS="$(uname -s)"

if [ $HOST_OS = "Darwin" ]; then
 [ -f ~/.bash_profile_mac ] && source ~/.bash_profile_mac
 [ -f ~/.bash_profile_securedocs ] && source ~/.bash_profile_securedocs
 [ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
fi
[ -f ~/.bash_local ] && source ~/.bash_local


#--- PERSONAL
export DEFAULT_USER="brendanshanny"
alias resource="echo ---------------------- && echo Pouring another cup... && echo ---------------------- && source ~/.bash_profile"
alias editprofile="vi ~/.bash_profile"

#--- git
alias gst="git st"
alias gco="git co"
alias gb="git b -v"
alias stashl="git stash list"
alias stash="git stash save"
alias fixgpg="export GPG_TTY=${tty}"
alias rebase="echo Fetching...; git fetch; echo Done; echo Rebasing...; git rebase; echo Done;"
export GPG_TTY=${tty}

#--- tmux
alias ta="tmux attach -t"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias tls="tmux ls"
set ignoreeof  # Same as setting IGNOREEOF=10

#--- GO
export GOPATH="$HOME/go"

#--- Ruby
eval "$(rbenv init -)"

#--- Other
if [ -f /usr/local/opt/mcfly/mcfly-bash.sh ]; then
  . /usr/local/opt/mcfly/mcfly-bash.sh
fi

#--- Functions
function aws_login() {
  $(aws ecr get-login --region us-east-1 --no-include-email)
}
function stashp() {
  git stash pop stash@{$1}
}
function stashd() {
  git stash drop stash@{$1}
}
