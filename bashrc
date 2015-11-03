# only on mac
if [[ "$(uname)" = "Darwin"  ]]; then
    maven=~/opt/apache-maven-3.3.3/bin
    activator=~/opt/activator-dist-1.3.6
    export PATH=$activator:$maven:$PATH
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
    export DROPBOX=~/Dropbox
    export WORK="$DROPBOX/Projects"
    export DESKTOP=~/Desktop
    
    alias work='cd $WORK && ll'
    alias desktop='cd $DESKTOP && ll'
    alias reconfig='. ~/.zshrc'
else
    opt_dir=/home/$USER/opt
    python_version=3.5.0
    
    python3=$opt_dir/python$python_version/bin
    vim=$opt_dir/vim74/bin

    export PATH=$vim:$python3:$PATH
    export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
fi

export GREP_OPTIONS='--color=auto'

# set vim mode
set -o vi

# set color
if ! [[ "$(uname)" = "Darwin"  ]]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
fi
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# virtualenvwrapper
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs
if [[ "$(uname)" = "Darwin"  ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
else
  export VIRTUALENVWRAPPER_PYTHON=$python3/python3
fi
if [ -e $VIRTENVWRAPPER ]; then
  source $VIRTENVWRAPPER
fi

alias home='cd ~ && ll'
alias ll='ls -alFhG'

change_dir()
{
    cd "$1";
    ls -alFhG;
};
alias g='change_dir'

