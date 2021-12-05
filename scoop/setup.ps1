#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.config" -Hide
New-Directory -Path "$HOME\scoop" -Hide

# Create softlink to 'config.json' and hide it.
Set-Softlink -Path "$HOME\.config\scoop\config.json" -Target "$PSScriptRoot\config.json"

# Install scoop

# Install scoop dependencies
scoop install git-crypt
scoop install 7zip
scoop install curl

# Hide related files
Hide-File "$HOME\.lesshst"
