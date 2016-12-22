#!/bin/bash

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias mdb='mongod --config /usr/local/etc/mongod.conf'

export RBENV_ROOT=/usr/local/var/rbenv
export PATH="/usr/local/var/rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The full pathname of the directory that contains Daikon
export DAIKONDIR=~/Applications/daikon

# The full pathname of the directory that contains the Java JDK
os="$(uname -s)"
if [  $os == "Darwin" ]; then
  export JAVA_HOME=/Library/Java/Home
elif [ $os == "Linux" ]; then
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle

  export PATH=~/Applications/maven/bin:$PATH
  export PATH=~/Applications/ant/bin:$PATH
  export PATH=~/local/bin:$PATH

fi

if [ -f $DAIKONDIR/scripts/daikon.bashrc ]; then
  source $DAIKONDIR/scripts/daikon.bashrc
fi

# For defects4j projects
export PATH=~/Applications/defects4j/framework/bin:~/Applications/defects4j/framework/util:$PATH

export CLICOLOR=1
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH=./bin:$PATH


# Config for nvm
export NVM_DIR="$HOME/.nvm"
if [ -f  "$(brew --prefix nvm)/nvm.sh" ]; then
  . "$(brew --prefix nvm)/nvm.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Config for KF6
export LOGDIR=$HOME/Documents/logs/kf6
export MONGOLAB_URI=mongodb://localhost/kf6-dev
