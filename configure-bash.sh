# configure bash
if [ "$(uname)" == "Darwin"  ]; then
  home_dir=/Users/$USER
  config_dir=$home_dir/server-config
  echo "### configuring bashrc ..."
  if ! [[ "source $config_dir/bashrc" = $(tail -1 ~/.zshrc) ]]; then
    echo "source $config_dir/bashrc" | sudo tee -a ~/.zshrc > /dev/null
  fi
else
  home_dir=/home/$USER
  config_dir=$home_dir/server-config
  echo "### configuring bashrc ..."
  if ! [[ "source $config_dir/bashrc" = $(tail -1 /etc/bashrc) ]]; then
    echo "source $config_dir/bashrc" | sudo tee --append /etc/bashrc > /dev/null
  fi
fi

