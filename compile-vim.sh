# compile and install vim
./configure \
  --prefix=/usr/local/
  --with-features=huge \
  --with-compiledby="Haiyang" \
  --enable-multibyte \
  --enable-rubyinterp \
  --enable-luainterp \
  --with-lua-prefix=/usr --with-luajit \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/local/lib/python2.7/config/ \
  --enable-cscope \
  --enable-perlinterp \
  --enable-fontset \
  --enable-fail-if-missing
