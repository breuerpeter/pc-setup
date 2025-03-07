eval "$(starship init zsh)"

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

# Additions to PATH
export PATH="$HOME/.local/bin:$PATH"

# Aliases
alias wireshark='wireshark & disown'

if [ -n "$WSL_DISTRO_NAME" ]; then
    # Add Windows installation of Cursor to PATH
    export PATH="$PATH:/mnt/c/Users/peter/AppData/Local/Programs/cursor/resources/app/bin"
else
    # Add Cursor alias
    function cursor() {
        # Get the absolute path of the argument
        if [ $# -eq 0 ]; then
            # If no arguments, use current directory
            local abs_path=$(realpath .)
        else
            # Convert the provided path to absolute path
            local abs_path=$(realpath "$1")
        fi
        
        # Launch Cursor with the absolute path
        /opt/cursor/Cursor.AppImage --no-sandbox "$abs_path" > /dev/null 2>&1 & disown
    }
fi