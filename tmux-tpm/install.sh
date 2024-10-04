#!/bin/bash

# Step 1: Install tmux using apt
echo "Installing tmux..."
sudo apt update
sudo apt install -y tmux

# Step 2: Install Tmux Plugin Manager (TPM)
echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Step 3: Move the tmux.conf file to the global location (/etc/tmux.conf)
echo "Moving tmux.conf to /etc/tmux.conf..."
sudo cp tmux.conf .tmux.conf

# Step 4: Install TPM plugins
echo "Installing TPM plugins..."
tmux run-shell ~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Tmux setup complete!"
