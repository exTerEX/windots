#!/usr/bin/env pwsh

# Create softlink to '.wslconfig' and hide it.
Set-Softlink -Path "$HOME\.wslconfig" -Target "$PSScriptRoot\.wslconfig" -Hide

# Bash on Windows
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null

# Set default version
#wsl --set-default-version 2

# Install distributions
#wsl --install --distribution Ubuntu

# Set default distribution
#wsl --set-default Ubuntu

# Output summary
#wsl --status
