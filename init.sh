curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py
python3 -m pip install powerline-status
python3 -m pip install thefuck

powerline_path=$(pip show powerline-status | grep Location: | sed 's/Location: //')
cp default.json "$powerline_path/powelrine/config_files/themes/tmux"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.zsh

sudo apt update
sudo apt install zsh
source ~/.zsh/antigen.zsh

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
cd ~

curl -sS https://starship.rs/install.sh | sh

sudo apt install tmux tree tldr build-essential unzip ripgrep \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

