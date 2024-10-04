#!/bin/bash

# Backup the current .tmux.conf to this directory
echo "Backing up current .tmux.conf..."
cp ~/.tmux.conf ./tmux.conf

echo "Backup complete! You can now commit the config files."
