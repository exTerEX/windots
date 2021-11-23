#!/usr/bin/env pwsh

# Create related directories
Create-Dir -Path "$HOME\.gpg"

# Create softlink to 'public_keys.gpg'.
Create-Softlink -Path "$HOME\.gpg\public_keys.gpg" -Target "$PSScriptRoot\public_keys.gpg"

# Create softlink to 'private_keys.gpg'.
Create-Softlink -Path "$HOME\.gpg\private_keys.gpg" -Target "$PSScriptRoot\private_keys.gpg"
