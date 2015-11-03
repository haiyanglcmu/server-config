# configure bash

echo "### configuring bashrc ..."
if ! [[ "source $config_dir/bashrc" = $(tail -1 /etc/bashrc) ]]; then
  echo "source $config_dir/bashrc" | sudo tee --append /etc/bashrc > /dev/null
fi
