#!/bin/bash

# check if in windows
windows() { [[ -n "$WINDIR" ]]; }
mac() { [[ "$OSTYPE" == "darwin"* ]]; }

# use macvim on mac
if mac; then alias vim="mvim -v"; fi

export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export PATH=/usr/local/bin:$PATH;
export DESKTOP=~/Desktop
export DROP=~/Dropbox
export VIRTENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
export HOME=~
export LESSCHARSET=utf-8
export CONFIG=~/myconfig

if windows; then
  export TOTALCMD=c:\totalcmd\totalcmd.exe
  export WORK=d:/Projects
else
  export WORK=~/projects
fi

# set color
if ! windows; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
  if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  else
    export TERM='xterm-color'
  fi
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

if windows; then
  alias ll='ls -alFhG --show-control-chars'
else
  alias ll='ls -alFhG'
fi

## shortcuts
alias desktop='cd $DESKTOP && ll'
alias work='cd $WORK && ll' 
alias home='cd $HOME && ll'
alias drop='cd $DROP && ll'
alias config='cd $CONFIG && ll'

alias vimrc='vim $CONFIG/vimrc'
alias bashrc='vim $CONFIG/bashrc'

#################################################
## create link on win or unix
#################################################

# With one parameter, it will check whether the it is a symlink.
# With two parameters, it will create a symlink to a file or directory
# syntax: link $linkname $target
link() {
    if [[ -z "$2" ]]; then
        # Link-checking mode.
        if windows; then
            fsutil reparsepoint query "$1" > /dev/null
        else
            [[ -h "$1" ]]
        fi
    else
        # Link-creation mode.
        if windows; then
            # Windows needs to be told if it's a directory or not. Infer that.
            # Also: note that we convert `/` to `\`. In this case it's necessary.
            if [[ -d "$2" ]]; then
                cmd <<< "mklink /D \"$1\" \"${2//\//\\}\"" > /dev/null
            else
                cmd <<< "mklink \"$1\" \"${2//\//\\}\"" > /dev/null
            fi
        else
            # You know what? I think ln's parameters are backwards.
            ln -s "$2" "$1"
        fi
    fi
}
