if [ "$(uname)" == "Darwin"  ]; then
  home_dir=/Users/$USER
else
  home_dir=/home/$USER
fi
config_dir=$home_dir/server-config

nginx_url=http://nginx.org/download/nginx-1.9.9.tar.gz
nginx_install_dir=$home_dir/opt/nginx/

# download and install nginx

wget $nginx_url -O ~/softwares/nginx.tar.gz &&
cd $home_dir/softwares
mkdir -p $home_dir/softwares/nginx
tar zxvf nginx.tar.gz -C $home_dir/softwares/nginx --strip-components 1
cd ~/softwares/nginx

./configure --prefix=$nginx_install_dir   \
            --with-http_ssl_module &&
make &&
make install
