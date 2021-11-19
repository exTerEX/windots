#!/usr/bin/env pwsh

# TODO: Check if scoop isn't installed and install it.
# TODO: Install 7zip, git, git-lfs, git-crypt

If (-not (test-path "$HOME/.config")) { mkdir "$HOME/.config" }
if (!(((Get-Item -Path "$HOME/.config" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.config" -Force).Attributes += "Hidden"
}

$SCOOP_PATH = "$HOME/.config/scoop/config.json"
$SCOOP_TARGET = "$PWD/scoop/config.json"

if (Test-Path -Path $SCOOP_PATH) {
    if (!(Get-Item $SCOOP_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of scoop/config.json to scoop/config.json.old..." -ForegroundColor Blue
        Rename-Item -Path $PWSH_PATH -NewName "config.json.old"

        Write-Host "Linking: $SCOOP_TARGET->$SCOOP_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SCOOP_PATH -Target $SCOOP_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Linking: $SCOOP_TARGET->$SCOOP_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SCOOP_PATH -Target $SCOOP_TARGET -Force | Out-Null
}

if (!(((Get-Item -Path "$HOME/scoop" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/scoop" -Force).Attributes += "Hidden"
}
