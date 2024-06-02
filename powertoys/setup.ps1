#!/usr/bin/env pwsh

#Install Powertoys
# TODO: Install

# Remove previous settings file
Remove-Item -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Force

# Create softlink to 'PowerToys'.
Set-Softlink -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Target "$PSScriptRoot\Powertoys" -Hide
