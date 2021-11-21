#!/usr/bin/env pwsh

# Create new machine scoped variables.

Set-Item -Path env:powershell -Value "C:\Windows\System32\WindowsPowerShell\v1.0"
Set-Item -Path env:pwsh -Value env:powershell

# Create softlink to 'profile.ps1'.
Create-Softlink -Path "$env:powershell\profile.ps1" -Target "$PSScriptRoot\profile.ps1"
