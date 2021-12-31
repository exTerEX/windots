#!/usr/bin/env pwsh

# Create new machine scoped variables.
Set-Item -Path env:powershell -Value "C:\Windows\System32\WindowsPowerShell\v1.0"
Set-Item -Path env:pwsh -Value env:powershell

# Install PackageManagement
if (!(Get-Module -ListAvailable -Name PackageManagement)) {
    Install-Module -Name PackageManagement -Repository PSGallery
}

# Install posh-git
if (!(Get-Module -ListAvailable -Name posh-git)) {
    Install-Module posh-git -Repository PSGallery
}

# Install oh-my-posh
if (!(Get-Module -ListAvailable -Name oh-my-posh)) {
    Install-Module oh-my-posh -Repository PSGallery
}

# Install fonts
$Uri = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
New-Directory -Path "$env:programfiles (x86)\WindowsPowerShell\Cache"
$FilePath = Get-Zip -Uri $Uri -DestinationPath "$env:programfiles (x86)\WindowsPowerShell\Cache" -Extract

# TODO: Modify so the object is not installed if already installed
# FIXME: Allow for non-interactive installation that works
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Path $FilePath -Recurse -include *.ttf | ForEach-Object -Confirm { $fonts.CopyHere($_.fullname) }

# Remove extracted fonts folder
Remove-Item -Path $FilePath -Recurse -Force | Out-Null

# Create softlink to 'profile.ps1'.
Set-Softlink -Path "$env:powershell\profile.ps1" -Target "$PSScriptRoot\profile.ps1"
