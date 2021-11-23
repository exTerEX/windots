#!/usr/bin/env pwsh

# Create softlink to 'settings.json'.
Set-Softlink -Path "$env:localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PSScriptRoot\settings.json"
