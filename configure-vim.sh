# configure vim
if [ "$(uname)" == "Darwin"  ]; then
  home_dir=/Users/$USER
else
  home_dir=/home/$USER
fi
config_dir=$home_dir/server-config

## link vimrc and vimfiles
echo "### creating symbolic links to vimrc and vimfiles ..."
ln -s $config_dir/vimrc $home_dir/.vimrc
if ! [[ -e "$home_dir/.vim" ]]; then
  ln -s $config_dir/vimfiles $home_dir/.vim
fi

## get neobundle

echo "### cloning neobundle ..."
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $home_dir/.vim/bundle/neobundle.vim

## install powerline fonts

echo "### cloning powerline fonts ..."
git clone https://github.com/Lokaltog/powerline-fonts.git $config_dir/vimfiles/powerline-fonts
$config_dir/vimfiles/powerline-fonts/install.sh

## install neobundle plugins

echo "### installing neobundle plugins ..."
~/.vim/bundle/neobundle.vim/bin/neoinstall
