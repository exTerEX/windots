#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.pymol" -Hide
New-Directory -Path "$HOME\.pymol\cache"
New-Directory -Path "$HOME\.pymol\scripts"

# Create softlink to 'pymolrc.pml' and hide it.
Set-Softlink -Path "$HOME\pymolrc.pml" -Target "$PSScriptRoot\pymolrc.pml" -Hide

# Download scripts
If (!(test-path "$HOME\.pymol\scripts\pymol-ramachandran")) {
    git clone -- "https://github.com/exTerEX/pymol-ramachandran.git" "$HOME\.pymol\scripts"
}
