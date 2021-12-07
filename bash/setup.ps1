#!/usr/bin/env pwsh

# Create directories
New-Directory -Path "$HOME\.config\bash"

# Create softlink to '.bash_profile' and hide it.
Set-Softlink -Path "$HOME\.bash_profile" -Target "$PSScriptRoot\.bash_profile" -Hide

# Create softlink to '.bashrc' and hide it.
Set-Softlink -Path "$HOME\.bashrc" -Target "$PSScriptRoot\.bashrc" -Hide

# Create softlink to '.bash_aliases' and hide it.
Set-Softlink -Path "$HOME\.config\bash\.bash_aliases" -Target "$PSScriptRoot\.bash_aliases"

# Create softlink to '.bash_exports' and hide it.
Set-Softlink -Path "$HOME\.config\bash\.bash_exports" -Target "$PSScriptRoot\.bash_exports"

# Create softlink to '.bash_functions' and hide it.
Set-Softlink -Path "$HOME\.config\bash\.bash_functions" -Target "$PSScriptRoot\.bash_functions"
