home_dir=/home/$USER
config_dir=$home_dir/server-config

sudo yum install git -y
sudo yum groupinstall "Development Tools" -y
sudo yum install libffi libffi-devel -y
sudo yum install tree -y
sudo yum install ruby ruby-devel -y
sudo yum install ncurses ncurses-devel -y

python_version=3.5.0
python_url=https://www.python.org/ftp/python/$python_version/Python-$python_version\.tgz
python_src=Python-$python_version\.tgz
python_src_dir=Python-$python_version
python_install_dir=$home_dir/opt/python$python_version
python_config_dir=$python_install_dir/lib/python3.5/config-3.5m/
export PATH=$python_install_dir/bin:$PATH

# download and install python3
# http://www.linuxfromscratch.org/blfs/view/svn/general/python3.html

# mkdir -p ~/softwares
# wget $python_url -O ~/softwares/$python_src &&
# cd ~/softwares
# tar zxvf $python_src
# cd ~/softwares/$python_src_dir
# echo "$python_install_dir/lib" | sudo tee --append /etc/ld.so.conf > /dev/null
# sudo ldconfig
# CXX="/usr/bin/g++"                     \
# ./configure --prefix=$python_install_dir   \
#             --enable-shared            \
#             --with-system-expat        \
#             --with-system-ffi          \
#             --without-ensurepip &&
# make &&
# make install &&
# chmod -v 755 $python_install_dir/lib/libpython*

# install pip for python3
wget https://bootstrap.pypa.io/get-pip.py -O ~/softwares/get-pip.py &&
python3 ~/softwares/get-pip.py
sudo ln -sfF $python_install_dir/bin/pip /usr/bin/pip3

# install virtualenv & virtualenvwrapper
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
mkdir ~/.virtualenvs

vim_url=ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
vim_src=vim-7.4.tar.bz2
vim_src_dir=vim74
vim_install_dir=$home_dir/opt/vim74

# download and install vim

# wget $vim_url -O ~/softwares/$vim_src &&
# cd ~/softwares
# tar jxvf $vim_src
# cd ~/softwares/$vim_src_dir
# ./configure \
#   --prefix=$vim_install_dir      \
#   --with-features=huge           \
#   --with-compiledby="Haiyang"    \
#   --enable-multibyte             \
#   --enable-rubyinterp            \
#   --enable-python3interp         \
#   --with-python3-config-dir=$python_config_dir \
#   --enable-cscope                \
#   --enable-fontset               \
#   --enable-fail-if-missing &&
# make &&
# make install

# configure bash

# source $config_dir/bash-config.sh
# echo "source $config_dir/bash-config.sh" | sudo tee --append /etc/bashrc > /dev/null

# configure vim

## link vimrc and vimfiles
ln -s $config_dir/vimrc $home_dir/.vimrc
if ! [[ -e "$home_dir/.vim" ]]; then
  ln -s $config_dir/vimfiles $home_dir/.vim
fi

## get neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $home_dir/.vim/bundle/neobundle.vim

## install powerline fonts
git clone https://github.com/Lokaltog/powerline-fonts.git $config_dir/vimfiles/powerline-fonts
$config_dir/vimfiles/powerline-fonts/install.sh

mv ~/.vim/bundle/neobundle.vim ~/.vim/
rm -rf ~/.vim/bundle/*
mv ~/.vim/neobundle.vim ~/.vim/bundle/

~/.vim/bundle/neobundle.vim/bin/neoinstall
