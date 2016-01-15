if [ "$(uname)" == "Darwin"  ]; then
  home_dir=/Users/$USER
else
  home_dir=/home/$USER
fi
config_dir=$home_dir/server-config

python_version=3.5.0
python_url=https://www.python.org/ftp/python/$python_version/Python-$python_version\.tgz
python_src=Python-$python_version\.tgz
python_src_dir=Python-$python_version
python_install_dir=$home_dir/opt/python$python_version
python_config_dir=$python_install_dir/lib/python3.5/config-3.5m/
export PATH=$python_install_dir/bin:$PATH

# download and install python3
# http://www.linuxfromscratch.org/blfs/view/svn/general/python3.html

wget $python_url -O ~/softwares/$python_src &&
cd ~/softwares
tar zxvf $python_src
cd ~/softwares/$python_src_dir
echo "$python_install_dir/lib" | sudo tee --append /etc/ld.so.conf > /dev/null
sudo ldconfig
CXX="/usr/bin/g++"                     \
./configure --prefix=$python_install_dir   \
            --enable-shared            \
            --with-system-expat        \
            --with-system-ffi          \
            --without-ensurepip &&
make &&
make install &&
chmod -v 755 $python_install_dir/lib/libpython*

# install pip for python3
wget https://bootstrap.pypa.io/get-pip.py -O ~/softwares/get-pip.py &&
python3 ~/softwares/get-pip.py
sudo ln -sfF $python_install_dir/bin/pip /usr/bin/pip3

# install virtualenv & virtualenvwrapper
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
mkdir ~/.virtualenvs
