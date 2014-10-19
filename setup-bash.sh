#!/bin/bash

# this script needs to be sourced

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $CURR_DIR
source ./bashrc
BASHRC="$( printf "\nsource $CONFIG/bashrc\n" )"
sudo chmod a+w /etc/bashrc
echo $BASHRC >> /etc/bashrc
sudo chmod a-w /etc/bashrc
