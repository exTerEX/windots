#!/usr/bin/env pwsh

# Create related directories
Create-Dir -Path "$HOME\.pymol"
Create-Dir -Path "$HOME\.pymol\cache" -NoHide
Create-Dir -Path "$HOME\.pymol\scripts" -NoHide

# Create softlink to 'pymolrc.pml' and hide it.
Create-Softlink -Path "$HOME\pymolrc.pml" -Target "$PSScriptRoot\pymolrc.pml" -Hide

# Download scripts
git clone -- "https://github.com/exTerEX/pymol-ramachandran.git" "$HOME\.pymol\scripts"
