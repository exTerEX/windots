#!/usr/bin/env pwsh

# Create new machine scoped variables.
Set-Item -Path env:powershell -Value "C:\Windows\System32\WindowsPowerShell\v1.0"
Set-Item -Path env:pwsh -Value env:powershell

# Install oh-my-posh
# TODO: Install winstore instead of exe?
if (!(where.exe oh-my-posh)) {
    # TODO: Allow interactive, see issue #8
    winget install JanDeDobbeleer.OhMyPosh --scope=machine --architecture=x64
}

# Install fonts
oh-my-posh font install # TODO: Specify font

# Create softlink to 'profile.ps1'.
Set-Softlink -Path "$env:powershell\profile.ps1" -Target "$PSScriptRoot\profile.ps1"
