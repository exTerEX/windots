#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.vscode-R" -Hide
New-Directory -Path "$HOME\.config\R"

# Install R
winget install RProject.R --architecture x64 --accept-package-agreements --accept-source-agreements

# Set R paths
$RPATH = "$env:programfiles\R\R-*\bin\x64" | Convert-Path
$REGREXPATH = [regex]::Escape($RPATH)
$ARRAYPATH = $env:path -split ";" | Where-Object { $_ -notMatch "^$REGREXPATH\\?" }
$env:path = ($ARRAYPATH + $RPATH) -join ";"

# Create softlink to '.Rprofile'.
Set-Softlink -Path "$HOME\.Rprofile" -Target "$PSScriptRoot\.Rprofile"

# Install R packages
Rscript R/packages.R
