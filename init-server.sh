home_dir=/home/$USER
config_dir=$home_dir/server-config

sudo yum install git -y
sudo yum groupinstall "Development Tools" -y
sudo yum install libffi libffi-devel -y
sudo yum install tree -y
sudo yum install ruby ruby-devel -y
sudo yum install ncurses ncurses-devel -y
sudo yum install lua lua-devel luajit -y

mkdir -p ~/softwares

source $config_dir/configure-bash.sh
source $config_dir/install-python.sh
source $config_dir/install-vim.sh
source $config_dir/configure-vim.sh
