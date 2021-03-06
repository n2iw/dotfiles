# Path to your oh-my-zsh installation.
export ZSH=/Users/james/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/james/Applications/defects4j/framework/bin:/Users/james/Applications/defects4j/framework/util:$PATH"
export PATH="/Users/james/Applications/daikon/scripts:/Users/james/Applications/daikon/plume-lib/bin:$PATH"
export PATH="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/bin:$PATH"
export PATH="/usr/local/var/rbenv/shims:/usr/local/var/rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Users/james/myprojects/InvariantCompare:/Users/james/myprojects/scripts:$PATH"
export PATH="./bin:~/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
alias mdb='mongod --config /usr/local/etc/mongod.conf'
alias bash='bash;source ~/.bash_profile'
alias vi='nvim'
alias r='rails'
alias n='node'

export CLASSPATH=.:$CLASSPATH

if [ -f ~/.secret.sh ]; then
  source ~/.secret.sh
fi

export RBENV_ROOT=/usr/local/var/rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The full pathname of the directory that contains Daikon
export DAIKONDIR=/Users/james/Applications/daikon
# The full pathname of the directory that contains the Java JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
source $DAIKONDIR/scripts/daikon.zsh

