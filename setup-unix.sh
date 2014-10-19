#!/bin/bash

# this script needs to be sourced

## set up bashrc

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $CURR_DIR
 
source ./bashrc
 
if ! [[ $CURR_DIR = $CONFIG ]]; then
  echo "moving folder into home directory ..."
  mv $CURR_DIR $CONFIG
  cd $CONFIG
fi

echo "$( printf "\nsource $CONFIG/bashrc\n" )" | sudo tee -a /etc/bashrc > /dev/null
