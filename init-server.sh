bashrc=/etc/bashrc
config_dir=/home/$USER/server-config
str_bash="source $config_dir/bashrc.server"

echo "[INFO] configuring bashrc ..."
if ! [[ $str_bash = $(tail -1 $bashrc) ]]; then
  echo $str_bash | sudo tee --append $bashrc > /dev/null
else
  echo "[INFO] bashrc already configured ..."
fi
source $bashrc

softwares=("git" "libffi" "libffi-devel" "tree" "ruby" "ruby-devel" \
           "ncurses" "ncurses-devel" "lua" "lua-devel" "luajit" "zlib" "zlib-devel" \
           "expat" "expat-devel" "openssl" "openssl-devel" "readline" "readline-devel" \
           "sqlite-devel" "gdbm" "gdbm-devel" "xz" "xz-devel" "bzip2-devel" "tcl-devel" "pcre-devel")
sudo yum groupinstall "Development Tools" -y
for software in ${softwares[@]}
do
  sudo apt-get install $software -y || sudo yum install $software -y
done

mkdir -p ~/softwares

source $config_dir/configure-bash.sh
source $config_dir/install-python.sh
source $config_dir/install-vim.sh
source $config_dir/configure-vim.sh
