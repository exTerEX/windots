#!/usr/bin/env pwsh

# Create softlink to the Winget configuration file to keep specific settings
# and activated experimental features in sync.
$Path = "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"
$Target = "$PSScriptRoot\settings.json"
Set-Softlink -Path "$Path\LocalState\settings.json" -Target $Target
