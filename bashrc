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
alias vim='mvim'
alias gst='git status'
alias gd='git diff'
alias gaa='git add -A'
alias ga='git add'
alias gcmsg='git commit -m'
alias gp='git push'
alias ggl='git log --oneline --graph --decorate'
alias diff='colordiff'


export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added for speeding up rails commands with Spring

export PATH=~/bin:$PATH
export PATH=~/myprojects/scripts:$PATH
export PATH=~/myprojects/invariant_tools:$PATH
export PATH=~/myprojects/research_tools:$PATH

export CATALINA_HOME=$HOME/Applications/apache-tomcat-7.0.70
export CLASSPATH=.:$HOME/Applications/uJava/mujava.jar:$HOME/Applications/uJava/openjava.jar:$CATALINA_HOME/lib/jsp-api.jar:/Library/Java/Home/lib/tools.jar:$CLASSPATH
export PATH=$CATALINA_HOME/bin:$PATH

# Let Homebrew work with XCode 7
export TRAVIS=1

if [ -f $HOME/.secret.sh ]; then
  source "$HOME/.secret.sh"
fi

# Resty setup
if [ -f $HOME/.resty ]; then
  source "$HOME/.resty"
fi


# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include

