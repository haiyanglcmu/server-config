#!/bin/zsh

maven=~/opt/apache-maven-3.3.3/bin
activator=~/opt/activator-dist-1.3.6
export PATH=$activator:$maven:$PATH
export DROPBOX=~/Dropbox
export WORK="$DROPBOX/Projects"
export DESKTOP=~/Desktop

set -o vi

alias work='cd $WORK && ll'
alias home='cd ~ && ll'
alias config='cd $WORK/myconfig/ && ll'
alias desktop='cd $DESKTOP && ll'

alias ll='ls -alFhG'
alias reconfig='. ~/.zshrc'

change_dir()
{
    cd "$1";
    ls -alFhG;
};
alias g='change_dir'

bindkey '^R' history-incremental-search-backward
