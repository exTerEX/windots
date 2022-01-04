#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.gnupg" -Hide

# Create softlink to 'gpg-agent.conf'.
Set-Softlink -Path "$HOME\.gnupg\gpg-agent.conf" -Target "$PSScriptRoot\gpg-agent.conf"
