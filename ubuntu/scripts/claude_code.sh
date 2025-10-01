#!/bin/bash

if ! [ -n "$WSL_DISTRO_NAME" ]; then
	echo "Claude Code setup in progress..."

	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	UBUNTU_DIR="$(dirname "$SCRIPT_DIR")"
	CONFIG_DIR="$UBUNTU_DIR/config"

    # Claude Code
	curl -fsSL https://claude.ai/install.sh | bash

	# Connect Docker MCP Gateway to Claude Code
	claude mcp add docker-mcp-local --scope user docker mcp gateway run

	# Create symlinks for prompt templates
	mkdir -p ~/.claude/commands
	ln -sf $CONFIG_DIR/claude_code/* ~/.claude/commands/ 2>/dev/null || true

    echo "Claude Code setup complete"
fi