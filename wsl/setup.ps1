#!/usr/bin/env pwsh

# Create softlink to '.wslconfig' and hide it.
Set-Softlink -Path "$HOME\.wslconfig" -Target "$PSScriptRoot\windows\.wslconfig" -Hide

# Setup system for WSL2
wsl --install

# Set default version
wsl --set-default-version 2

# Install distributions
wsl --install --distribution Ubuntu

# Set default distribution
wsl --set-default Ubuntu

# Output summary
wsl --status
