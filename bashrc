#!/bin/bash

export GREP_OPTIONS='--color=auto'
export EDITOR='subl -w'
export LESSCHARSET=utf-8
export PATH=~/opt/apache-maven-3.3.3/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh

export HOME=~
export DESKTOP=~/Desktop
export TMP=~/tmp/
export DROP=~/Dropbox
export CONFIG=$DROP/projects/myconfig
export WORK=$DROP/projects
export SOFTWARES=$DROP/resources/softwares

# set color
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@$(scutil --get ComputerName)\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

## set vim mode
set -o vi

## virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
if [ -e $VIRTENVWRAPPER ]; then
  source $VIRTENVWRAPPER
fi

## alias setttings
change_dir()
{
    cd "$1";
    ls -alFhG;
};
alias g='change_dir'

alias rebash='source $CONFIG/bashrc'
alias df='df -h'

alias ll='ls -alFhG'

## shortcuts
alias desktop='cd $DESKTOP && ll'
alias work='cd $WORK && ll'
alias home='cd $HOME && ll'
alias dropbox='cd $DROP && ll'
alias config='cd $CONFIG && ll'
alias tmp='cd $TMP && ll'
alias vimrc='subl $CONFIG/vimrc'
alias bashrc='subl $CONFIG/bashrc'
alias soft='cd $SOFTWARES && ll'
