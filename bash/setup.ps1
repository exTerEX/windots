#!/usr/bin/env pwsh

# Create softlink to '.bashrc' and hide it.
Set-Softlink -Path "$HOME\.bashrc" -Target "$PSScriptRoot\.bashrc" -Hide

# Create softlink to '.bash_profile' and hide it.
Set-Softlink -Path "$HOME\.bash_profile" -Target "$PSScriptRoot\.bash_profile" -Hide
