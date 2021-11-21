#!/usr/bin/env pwsh

# Create related directories
Create-Dir -Path "$HOME\.config"
Create-Dir -Path "$HOME\scoop"

# Create softlink to 'config.json' and hide it.
Create-Softlink -Path "$HOME\.config\scoop\config.json" -Target "$PSScriptRoot\config.json"
