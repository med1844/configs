# install rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# now install things via cargo install
cargo install zellij ripgrep bat

# setup zellij
ln -s $(pwd)/zellij ~/.config/zellij
zellij setup --generate-completion fish >~/.config/fish/completions/zellij.fish

# install neovim >= 0.8
sudo snap install --beta nvim --classic

# setup fisher, a fish shell plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# update ls to exa
sudo apt install exa

# setup fish
chsh -s $(which fish)

# these commands must be executed in the fish shell... have no idea how to
fish_config theme choose "ayu Dark"
set -U fish_user_paths ~/.local/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# setup prompt (starship)
curl -sS https://starship.rs/install.sh | sh

# setup neovim configuration
ln -s $(pwd)/nvim ~/.config/nvim

# setup helix config
ln -s $(pwd)/helix ~/.config/helix

# install libraries that will be used during pyenv installing python from source
sudo apt install tree tldr build-essential unzip \
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

# setup tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # make sure prefix-I after installation

# copy all config files to their expected location
python3 $(pwd)/sync.py
