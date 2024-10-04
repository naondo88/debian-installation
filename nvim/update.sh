#!/bin/bash

# Function to display messages
function echo_info() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

function echo_warning() {
  echo -e "\033[1;33m[WARNING]\033[0m $1"
}

function echo_error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

function echo_success() {
  echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

CURRENT_DIR=$(pwd)
NVIM_CONFIG_DIR="$HOME/.config/nvim"
TARGET_DIR="$CURRENT_DIR/nvim"
MASON_DEP_FILE="$CURRENT_DIR/mason-dependencies.txt"
MASON_PACKAGE_DIR="$HOME/.local/share/nvim/mason/packages"

# Step 1: Check if the current nvim subdirectory exists, delete if found
if [[ -d "$TARGET_DIR" ]]; then
  echo_info "Deleting the current nvim subdirectory in $CURRENT_DIR..."
  rm -rf "$TARGET_DIR"
  if [[ $? -ne 0 ]]; then
    echo_error "Failed to delete the current nvim subdirectory. Exiting."
    exit 1
  fi
else
  echo_info "No existing nvim subdirectory found in $CURRENT_DIR. Skipping deletion."
fi

# Step 2: Copy the ~/.config/nvim directory to the current directory
echo_info "Copying $NVIM_CONFIG_DIR to $CURRENT_DIR..."
cp -r "$NVIM_CONFIG_DIR" "$TARGET_DIR"

if [[ $? -ne 0 ]]; then
  echo_error "Failed to copy the ~/.config/nvim directory. Exiting."
  exit 1
fi

echo_success "The nvim subdirectory has been successfully updated with the contents of ~/.config/nvim!"

# Step 3: Update mason-dependencies.txt
if [[ -d "$MASON_PACKAGE_DIR" ]]; then
  echo_info "Updating mason-dependencies.txt with the installed Mason packages..."

  /usr/bin/ls "$MASON_PACKAGE_DIR" >"$MASON_DEP_FILE"

  if [[ $? -ne 0 ]]; then
    echo_error "Failed to update mason-dependencies.txt. Exiting."
    exit 1
  fi

  echo_success "mason-dependencies.txt has been successfully updated with the installed Mason packages!"
else
  echo_warning "Mason packages directory not found. Skipping Mason update."
fi
