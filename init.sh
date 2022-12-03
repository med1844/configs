curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
python3 -m pip install powerline-status

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo apt update
sudo apt install zsh
curl -sS https://starship.rs/install.sh | sh

sudo apt install tmux
sudo apt install tree
sudo apt install tldr
sudo apt install build-essential
sudo apt install unzip

