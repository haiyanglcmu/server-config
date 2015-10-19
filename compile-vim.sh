# compile and install vim
./configure \
  --prefix=/usr/local/ \
  --with-features=huge \
  --with-compiledby="Haiyang" \
  --enable-multibyte \
  --enable-rubyinterp \
  --enable-luainterp \
  --with-lua-prefix=/usr/local --with-luajit \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib/python2.7/config/ \
  --enable-cscope \
  --enable-fontset \
  --enable-fail-if-missing
