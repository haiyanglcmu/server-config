# link vimrc and vimfiles
ln -sfF $CONFIG/vimrc $HOME/.vimrc
ln -sfF $CONFIG/vimfiles $HOME/.vim

# get neobundle
mkdir -p ~/.vim/bundle
if ! [[ -e "$HOME/.vim/bundle/neobundle.vim" ]]; then
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi

# install powerline fonts
if ! [[ -e "$CONFIG/vimfiles/powerline-fonts" ]]; then
  git clone https://github.com/Lokaltog/powerline-fonts.git $CONFIG/vimfiles/powerline-fonts
  $CONFIG/vimfiles/powerline-fonts/install.sh
fi
