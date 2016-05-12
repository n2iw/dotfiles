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
export DAIKONDIR=/Users/james/Applications/daikon
# The full pathname of the directory that contains the Java JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_71.jdk/Contents/Home
if [ -f $DAIKONDIR/scripts/daikon.bashrc ]; then
  source $DAIKONDIR/scripts/daikon.bashrc
fi

# For defects4j projects
export PATH=~/Applications/defects4j/framework/bin:~/Applications/defects4j/framework/util:$PATH

export CLICOLOR=1
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH=./bin:$PATH

