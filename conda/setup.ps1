#!/usr/bin/env pwsh

$CONDA_PATH = "$HOME\.condarc"
$CONDA_TARGET = "$PWD\conda\.condarc"

if (Test-Path -Path $CONDA_PATH) {
    if (!(Get-Item $CONDA_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of .condarc to .condarc.old..." -ForegroundColor Blue
        Rename-Item -Path $CONDA_PATH -NewName ".condarc.old"

        Write-Host "Changing profile.ps1 with symbolic link: $CONDA_TARGET->$CONDA_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $CONDA_PATH -Target $CONDA_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Creating symbolic link: $CONDA_TARGET->$CONDA_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $CONDA_PATH -Target $CONDA_TARGET -Force | Out-Null
}

if (!(((Get-Item -Path $CONDA_TARGET -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $CONDA_TARGET -Force).Attributes += "Hidden"
}
