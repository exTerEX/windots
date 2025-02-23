#!/usr/bin/env pwsh

# Install GnuPG
if (!(where.exe gpg)) {
    winget install GnuPG.GnuPG --scope=machine
}

# Create related directories
New-Directory -Path "$HOME\.gpg" -Hide

# TODO: Make automatic setup of GPG keys
