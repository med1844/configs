if status is-interactive
    # Commands to run in interactive sessions can go here

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # ghcup
    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin /home/med/.ghcup/bin $PATH # ghcup-env

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f $HOME/miniforge3/bin/conda
        eval $HOME/miniforge3/bin/conda "shell.fish" hook $argv | source
    end
    # <<< conda initialize <<<

    source ~/.bash_aliases
    starship init fish | source
    zoxide init fish | source
end
