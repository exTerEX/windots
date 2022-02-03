#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.ssh" -Hide

# Create softlink to 'id_rsa'.
Set-Softlink -Path "$HOME\.ssh\id_rsa_azure" -Target "$PSScriptRoot\id_rsa_azure"

# Create softlink to 'id_rsa.pub'.
Set-Softlink -Path "$HOME\.ssh\id_rsa_azure.pub" -Target "$PSScriptRoot\id_rsa_azure.pub"

# Create softlink to 'id_rsa'.
Set-Softlink -Path "$HOME\.ssh\id_rsa" -Target "$PSScriptRoot\id_rsa"

# Create softlink to 'id_rsa.pub'.
Set-Softlink -Path "$HOME\.ssh\id_rsa.pub" -Target "$PSScriptRoot\id_rsa.pub"

# Create softlink to 'config'.
Set-Softlink -Path "$HOME\.ssh\config" -Target "$PSScriptRoot\config"
