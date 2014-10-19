# if ! mac; then
    # compile and install vim
# fi

# link vimrc and vimfiles
ln -sfF $CONFIG/vimrc $HOME/.vimrc
ln -sfF $CONFIG/vimfiles $HOME/.vim

# get neobundle
mkdir -p ~/.vim/bundle
if ! [[ -e "$HOME/.vim/bundle/neobundle.vim" ]]; then
  git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi 
