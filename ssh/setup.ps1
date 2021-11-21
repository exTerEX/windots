#!/usr/bin/env pwsh

# Create related directories
Create-Dir -Path "$HOME\.ssh"

# Create softlink to 'id_rsa'.
Create-Softlink -Path "$HOME\.ssh\id_rsa" -Target "$PSScriptRoot\id_rsa"

# Create softlink to 'id_rsa.pub'.
Create-Softlink -Path "$HOME\.ssh\id_rsa.pub" -Target "$PSScriptRoot\id_rsa.pub"

# Create softlink to 'knwon_hosts'.
Create-Softlink -Path "$HOME\.ssh\known_hosts" -Target "$PSScriptRoot\known_hosts"

# Create softlink to 'config'.
Create-Softlink -Path "$HOME\.ssh\config" -Target "$PSScriptRoot\config"
