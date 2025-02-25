#!/usr/bin/env pwsh

# Install GnuPG
if (!(where.exe gpg)) {
    winget install GnuPG.GnuPG --scope=machine
}

# Create related directories
New-Directory -Path "$HOME\.gpg" -Hide
New-Directory -Path "$HOME\.gnupg" -Hide

# GnuPG Settings
Set-Softlink -Path "$HOME\.gnupg\gpg.conf" -Target "$PSScriptRoot\gpg.conf"
Set-Softlink -Path "$HOME\.gnupg\common.conf" -Target "$PSScriptRoot\common.conf"

# TODO: Make automatic setup of GPG keys
