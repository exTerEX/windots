#!/usr/bin/env pwsh

# TODO: Check if scoop isn't installed and install it.
# TODO: Install 7zip, git, git-lfs, git-crypt

$DIR = "$HOME/.config"
$SCOOP_PATH = $DIR + "/scoop/config.json"
$SCOOP_TARGET = "$PWD/scoop/config.json"

If (-not (test-path $DIR)) { mkdir $DIR }
if (!(((Get-Item -Path $DIR -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $DIR -Force).Attributes += "Hidden"
}

if (Test-Path -Path $SCOOP_PATH) {
    if (!(Get-Item $SCOOP_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of scoop/config.json to scoop/config.json.old..." -ForegroundColor Blue
        Rename-Item -Path $PWSH_PATH -NewName "config.json.old"

        Write-Host "Changing profile.ps1 with symbolic link: $SCOOP_TARGET->$SCOOP_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SCOOP_PATH -Target $SCOOP_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Creating symbolic link: $SCOOP_TARGET->$SCOOP_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SCOOP_PATH -Target $SCOOP_TARGET -Force | Out-Null
}

$SCOOP_PATH = "$HOME/scoop"

if (!(((Get-Item -Path $SCOOP_PATH -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $SCOOP_PATH -Force).Attributes += "Hidden"
}
