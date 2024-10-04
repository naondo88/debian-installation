#!/bin/bash

# Variables
SSH_DIR="$HOME/.ssh"
CONFIG_FILE="$SSH_DIR/config"
KEY_NAME="github"
EMAIL="your-email@example.com"

# Create .ssh directory if it doesn't exist
if [ ! -d "$SSH_DIR" ]; then
  echo "Creating .ssh directory..."
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"
fi

# Generate SSH key for GitHub
if [ ! -f "$SSH_DIR/$KEY_NAME" ]; then
  echo "Generating SSH key for GitHub..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$SSH_DIR/$KEY_NAME" -N ""
else
  echo "SSH key for GitHub already exists."
fi

# Add GitHub SSH config
if ! grep -q "Host github.com" "$CONFIG_FILE"; then
  echo "Adding GitHub-specific SSH configuration to $CONFIG_FILE..."
  {
    echo "Host github.com"
    echo "  HostName github.com"
    echo "  User git"
    echo "  IdentityFile $SSH_DIR/$KEY_NAME"
    echo "  IdentitiesOnly yes"
  } >>"$CONFIG_FILE"
  chmod 600 "$CONFIG_FILE"
else
  echo "GitHub-specific SSH configuration already exists."
fi

# Output public key to copy to GitHub account
echo "Here is your public SSH key to add to GitHub:"
cat "$SSH_DIR/$KEY_NAME.pub"

echo "SSH setup for GitHub is complete."
