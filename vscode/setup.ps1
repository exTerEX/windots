#!/usr/bin/env pwsh

# Create softlink to 'settings.json'.
Set-Softlink -Path "$env:appdata\Code\User\settings.json" -Target "$PSScriptRoot\settings.json"
