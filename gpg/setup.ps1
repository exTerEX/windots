#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.gpg" -Hide

# Create softlink to 'public_keys.gpg'.
Set-Softlink -Path "$HOME\.gpg\public_keys.gpg" -Target "$PSScriptRoot\public_keys.gpg"

# Create softlink to 'private_keys.gpg'.
Set-Softlink -Path "$HOME\.gpg\private_keys.gpg" -Target "$PSScriptRoot\private_keys.gpg"