#!/usr/bin/env pwsh

$GIT_PATH = "$HOME\.gitconfig"
$GIT_TARGET = "$PWD\git\.gitconfig"

if (Test-Path -Path $GIT_PATH) {
    if (!(Get-Item $GIT_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of .gitconfig to .gitconfig.old..." -ForegroundColor Blue
        Rename-Item -Path $PWSH_PATH -NewName ".gitconfig.old"

        Write-Host "Linking: $GIT_TARGET->$GIT_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $GIT_PATH -Target $GIT_TARGET -Force
    }
}
else {
    Write-Host "Linking: $GIT_TARGET->$GIT_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $GIT_PATH -Target $GIT_TARGET -Force
}

if (!(((Get-Item -Path $GIT_PATH -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $GIT_PATH -Force).Attributes += "Hidden"
}
