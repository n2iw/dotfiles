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


export DAIKONDIR=/home/vidia/mingying/Applications/daikon
# The full pathname of the directory that contains the Java JDK
#export JAVA_HOME=/usr/lib/jvm/java-7-oracle
#source $DAIKONDIR/scripts/daikon.bashrc

# For defects4j projects
export PATH=~/Applications/defects4j/framework/bin:~/Applications/defects4j/framework/util:$PATH
export PATH=~/Applications/maven/bin:$PATH

export PATH=~/Applications/ant/bin:$PATH
export PATH=/home/vidia/mingying/local/bin:$PATH

export CLICOLOR=1
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH=./bin:$PATH

