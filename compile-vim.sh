# compile and install vim
./configure \
  --prefix=/usr/local/
  --with-features=huge \
  --with-compiledby="Haiyang" \
  --enable-multibyte \
  --enable-rubyinterp \
  --enable-luainterp \
  --enable-pythoninterp \
  --enable-cscope \
  --enable-perlinterp \
  --with-luajit \
  --enable-fontset \
  --enable-fail-if-missing
