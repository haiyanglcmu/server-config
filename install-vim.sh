if [ "$(uname)" == "Darwin"  ]; then
  home_dir=/Users/$USER
else
  home_dir=/home/$USER
fi
config_dir=$home_dir/server-config

# download and install luajit
wget http://luajit.org/download/LuaJIT-2.0.4.tar.gz -P ~/softwares/ &&
cd ~/softwares/
tar zxvf LuaJIT-2.0.4.tar.gz
cd LuaJIT-2.0.4
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
make && sudo make install

vim_url=ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
vim_src=vim-7.4.tar.bz2
vim_src_dir=vim74
vim_install_dir=$home_dir/opt/vim74

# download and install vim
echo "### installing vim ..."
wget $vim_url -O ~/softwares/$vim_src &&
cd ~/softwares
tar jxvf $vim_src
cd ~/softwares/$vim_src_dir
./configure \
  --prefix=$vim_install_dir       \
  --with-features=huge            \
  --with-compiledby="Haiyang"     \
  --enable-multibyte              \
  --enable-rubyinterp             \
  --enable-python3interp          \
  --with-python3-config-dir=$python_config_dir \
  --enable-luainterp \
  --with-luajit \
  --with-lua-prefix=/usr \
  --enable-cscope                 \
  --enable-fontset                \
  --enable-fail-if-missing &&
make &&
make install
