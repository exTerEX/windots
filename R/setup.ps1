#!/usr/bin/env pwsh

# Install R
winget install RProject.R --architecture x64 --accept-package-agreements --accept-source-agreements

# Create related directories
New-Directory -Path "$HOME\.vscode-R" -Hide

# Install R packages
# Find folder to Rscript
$PATH = "$env:programfiles\R"
$NAME = Get-ChildItem -Path $PATH -Name

# TODO: If more then 1 select largest number

$RPATH = "$PATH\$NAME\bin"

# Set R-path to environment path
# TODO: Check if RPath already is added?
Set-Item -Path $env:path -Value ($env:path + ";$RPATH")

Set-Location $RPATH
Rscript.exe R/packages.R
Set-Location $PSScriptRoot
