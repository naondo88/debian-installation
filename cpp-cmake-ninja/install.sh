#!/bin/bash

# Update package list
sudo apt update

# Install build-essential, cmake, and ninja-build
sudo apt install -y build-essential cmake ninja-build

# Confirm installations
gcc --version && g++ --version && cmake --version && ninja --version

echo "Installation of build-essential, cmake, and ninja is complete!"
