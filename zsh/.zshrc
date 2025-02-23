eval "$(starship init zsh)"

# Aliases
# alias wireshark='wireshark & disown'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/peter/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/peter/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/peter/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/peter/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# todo the following is written by cursor.sh
# Cursor alias
function cursor() {
    /opt/cursor.appimage --no-sandbox "${@}" > /dev/null 2>&1 & disown
}