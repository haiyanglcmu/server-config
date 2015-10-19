#!/bin/zsh

# only on mac
if [ "$(uname)" == "Darwin"  ]; then
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
fi

export GREP_OPTIONS='--color=auto'
# set vim mode
set -o vi
# set color
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@$(scutil --get ComputerName)\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
# virtualenvwrapper
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
if [ -e $VIRTENVWRAPPER ]; then
  source $VIRTENVWRAPPER
fi

alias home='cd ~ && ll'
alias config='cd ~/server-config/ && ll'
alias ll='ls -alFhG'

change_dir()
{
    cd "$1";
    ls -alFhG;
};
alias g='change_dir'

