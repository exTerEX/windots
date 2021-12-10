#!/usr/bin/env pwsh

# Install powertoys
$KEY = "{DAA80B28-95F8-4E2C-BED4-3446474AEDA4}"
$REGPATH = "HKLM:Software\Microsoft\Windows\CurrentVersion\Uninstall"
if (!(((Get-ChildItem $REGPATH) | Where-Object { $_."Name" -like "*$KEY*" } ).Length -gt 0)) {
    winget install XP89DCGQ3K6VLD --architecture x64 --accept-package-agreements
}

# Install
winget install XP89DCGQ3K6VLD --accept-package-agreements --accept-source-agreements

# Remove previous settings file
Remove-Item -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Force

# Create softlink to 'PowerToys'.
Set-Softlink -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Target "$PSScriptRoot\Powertoys" -Hide
