home_dir=/home/$USER
config_dir=$home_dir/server-config
vim_dir=$config_dir/vimfiles

## link vimrc and vimfiles
echo "[INFO] creating symbolic links to vimrc and vimfiles ..."
ln -s $config_dir/vimrc $home_dir/.vimrc
if ! [[ -e $home_dir/.vim ]]; then
  ln -s $config_dir/vimfiles $home_dir/.vim
fi

## install powerline fonts
echo "[INFO] cloning powerline fonts ..."
git clone https://github.com/Lokaltog/powerline-fonts.git $vim_dir/powerline-fonts
$config_dir/vimfiles/powerline-fonts/install.sh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /var/tmp/installer.sh
sh /var/tmp/installer.sh $vim_dir/dein
