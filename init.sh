# install shell & editor
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
sudo apt install neovim

# setup prompt (starship)
curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish

# setup neovim configuration
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -s $(pwd)/astronvim/user ~/.config/nvim/lua/user  # symlink everything in the repository to the target folder

# install libraries that will be used during pyenv installing python from source
sudo apt install tmux tree tldr build-essential unzip ripgrep \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# build py-env after build-essential is available
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
cd ~

# setup pip
curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm get-pip.py

# copy all config files to HOME
cp .* ~

