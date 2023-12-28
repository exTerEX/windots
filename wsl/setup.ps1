#!/usr/bin/env pwsh

# Create softlink to '.wslconfig' and hide it.
Set-Softlink -Path "$HOME\.wslconfig" -Target "$PSScriptRoot\.wslconfig" -Hide

# Bash on Windows
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null
