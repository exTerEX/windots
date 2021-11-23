#!/usr/bin/env pwsh

# Create softlink to '.gitignore' and hide it.
Set-Softlink -Path "$HOME\.gitconfig" -Target "$PSScriptRoot\.gitconfig" -Hide
