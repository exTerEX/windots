#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.vscode-R" -Hide
New-Directory -Path "$HOME\.config\R"
New-Directory -Path "$HOME\.config\R\lib"

# Create files
If (!(test-path "$HOME\.config\R\.Rhistory")) {
  New-Item -Path "$HOME\.config\R\" -Name ".Rhistory" -ItemType File | Out-Null
}

# Install R
$RPATH = "$env:programfiles\R\"
$REGPATH = "HKLM:Software\Microsoft\Windows\CurrentVersion\Uninstall"
if (!(((Get-ChildItem $REGPATH) | Where-Object { $_."Name" -like "*R*" } ).Length -gt 0)) {
  winget install RProject.R --architecture x64 --location $RPATH
}

# Set R paths
$RPATH = ($RPATH + "bin\x64")
$ARRAYPATH = [Environment]::GetEnvironmentVariable("Path", "Machine") -split ";"
[Environment]::SetEnvironmentVariable("Path", ($ARRAYPATH + $RPATH) -join ";", "Machine")

# Create softlink to '.Rprofile'.
$RPROFILEPATH = "$HOME\.config\R\.Rprofile"
Set-Softlink -Path $RPROFILEPATH -Target "$PSScriptRoot\.Rprofile"

# Set library path
$RLIBSPATH = "$HOME\.config\R\lib"

# Set environment variables
[System.Environment]::SetEnvironmentVariable("R_PROFILE_USER", $RPROFILEPATH, "User")
[System.Environment]::SetEnvironmentVariable("R_LIBS_USER", $RLIBSPATH, "User")

# Install R packages
# FIXME: Rscript R/packages.R
