#!/usr/bin/env pwsh

# Create softlink to '.wslconfig' and hide it.
Set-Softlink -Path "$HOME\.wslconfig" -Target "$PSScriptRoot\windows\.wslconfig" -Hide
