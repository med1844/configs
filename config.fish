if status is-interactive
    # Commands to run in interactive sessions can go here

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # ghcup
    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin /home/med/.ghcup/bin $PATH # ghcup-env

    # nvm
    if test -d "$HOME/.nvm"
        export NVM_DIR="$HOME/.nvm"
        bass source "$NVM_DIR/nvm.sh"
    end

    source "$HOME/.cargo/env.fish"

    source ~/.bash_aliases
    starship init fish | source
    zoxide init fish | source
end
