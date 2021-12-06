#!/usr/bin/env pwsh

# Create new machine scoped variables.
Set-Item -Path env:powershell -Value "C:\Windows\System32\WindowsPowerShell\v1.0"
Set-Item -Path env:pwsh -Value env:powershell

# Install PackageManagement
Install-Module -Name PackageManagement -Repository PSGallery

# Install posh-git
Install-Module posh-git -Repository PSGallery

# Install oh-my-posh
Install-Module oh-my-posh -Repository PSGallery

# Install fonts
$Uri = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
$FilePath = Get-Zip -Uri $Uri -Extract

$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Path $FilePath -Recurse -include *.ttf | ForEach-Object { $fonts.CopyHere($_.fullname) }

# Create softlink to 'profile.ps1'.
Set-Softlink -Path "$env:powershell\profile.ps1" -Target "$PSScriptRoot\profile.ps1"
