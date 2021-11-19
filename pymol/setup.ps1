#!/usr/bin/env pwsh

If (-not (test-path "$HOME/.pymol")) { mkdir "$HOME/.pymol" }
if (!(((Get-Item -Path "$HOME/.pymol" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.pymol" -Force).Attributes += "Hidden"
}

If (-not (test-path "$HOME/.pymol/cache")) { mkdir "$HOME/.pymol/cache" }
If (-not (test-path "$HOME/.pymol/scripts")) { mkdir "$HOME/.pymol/scripts" }

$PYMOL_PATH = "$HOME\pymolrc.pml"
$PYMOL_TARGET = "$PWD\pymol\pymolrc.pml"

if (Test-Path -Path $PYMOL_PATH) {
    if (!(Get-Item $PYMOL_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of pymolrc.pml to pymolrc.pml.old..." -ForegroundColor Blue
        Rename-Item -Path $CONDA_PATH -NewName "pymolrc.pml.old"

        Write-Host "Linking: $PYMOL_TARGET->$PYMOL_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $PYMOL_PATH -Target $PYMOL_TARGET -Force
    }
}
else {
    Write-Host "Linking: $PYMOL_TARGET->$PYMOL_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $PYMOL_PATH -Target $PYMOL_TARGET -Force
}

if (!(((Get-Item -Path $PYMOL_PATH -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $PYMOL_PATH -Force).Attributes += "Hidden"
}

$PYMOL_SCRIPT_LOCATION = "$HOME/.pymol/scripts"

Set-Location $PYMOL_SCRIPT_LOCATION
git clone "https://github.com/exTerEX/pymol-ramachandran.git"
