if status is-interactive
    # Commands to run in interactive sessions can go here

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    source ~/.bash_aliases
    starship init fish | source
end

