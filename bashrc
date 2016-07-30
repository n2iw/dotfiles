alias backup='launchctl start com.n2iw.james.backup'
alias ec2='ssh ec2'
alias ocean='ssh ocean'
alias lpmbp='ssh moyuzhang@lpmbp'
alias cth='ctags -R .'
alias cdsimp='cd ~/myprojects/Sites/simple_cms/'
alias cdmoyu='cd ~/myprojects/Sites/moyuzhang_app/'
alias ll='ls -lahG'
alias deploy='cap production deploy'
alias stage='cap staging deploy'
alias pg='postgres -D ~/Documents/postgres/ &> /usr/local/var/postgres.log &'
alias sync_time='rsync -a Time james@lpmbp:/Users/james/Experiments/'
alias vi='nvim'
alias gst='git status'
alias gd='git diff'
alias gaa='git add -A'
alias ga='git add'
alias gcmsg='git commit -m'
alias gp='git push'


export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added for speeding up rails commands with Spring

export PATH="~/bin:$PATH"
export PATH=~/myprojects/scripts:$PATH
export PATH=~/myprojects/InvariantCompare:$PATH

export CLASSPATH=.:$CLASSPATH

if [ -f $HOME/.secret.sh ]; then
  source "$HOME/.secret.sh"
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

