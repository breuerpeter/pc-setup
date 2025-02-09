# Ensure SSH Agent is running
if [ -z "$SSH_AUTH_SOCK" ]; then
    if [ -f "$HOME/.ssh/ssh-agent" ]; then
        export SSH_AUTH_SOCK=$(cat $HOME/.ssh/ssh-agent)
    fi

    # Check if the agent is actually working
    if [ ! -S "$SSH_AUTH_SOCK" ]; then
        echo "Starting a new ssh-agent..."
        ssh-agent -s | grep -o 'SSH_AUTH_SOCK=[^;]*' | sed 's/SSH_AUTH_SOCK=//' > "$HOME/.ssh/ssh-agent"
        export SSH_AUTH_SOCK=$(cat $HOME/.ssh/ssh-agent)
    fi
fi

# Add all private keys in ~/.ssh
for key in $HOME/.ssh/*; do
    if [[ -f "$key" && "$key" != *.pub ]]; then
        ssh-add "$key" 2>/dev/null
    fi
done