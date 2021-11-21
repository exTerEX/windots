#!/usr/bin/env pwsh

# Create softlink to 'settings.json'.
Create-Softlink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PSScriptRoot\settings.json"
