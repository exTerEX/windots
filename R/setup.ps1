#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.vscode-R" -Hide
New-Directory -Path "$HOME\.config\R"

# Install R
$REGPATH = "HKLM:Software\Microsoft\Windows\CurrentVersion\Uninstall"
if (!(((Get-ChildItem $REGPATH) | Where-Object { $_."Name" -like "*R*" } ).Length -gt 0)) {
  winget install RProject.R --architecture x64
}

# Set R paths
$RPATH = "$env:programfiles\R\R-*\bin\x64" | Convert-Path
$REGREXPATH = [regex]::Escape($RPATH)
$ARRAYPATH = [Environment]::GetEnvironmentVariable("Path", "Machine") -split ";" |
    Where-Object { $_ -notMatch "^$REGREXPATH\\?" }
[Environment]::SetEnvironmentVariable("Path", ($ARRAYPATH + $RPATH) -join ";", "Machine")

# Create softlink to '.Rprofile'.
$RPROFILEPATH = "$HOME\.config\R\.Rprofile"
Set-Softlink -Path $RPROFILEPATH -Target "$PSScriptRoot\.Rprofile"

# Set environment variables
[System.Environment]::SetEnvironmentVariable("R_PROFILE_USER", $RPROFILEPATH, "User")

# Install R packages
Rscript R/packages.R
