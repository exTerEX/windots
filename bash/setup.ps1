#!/usr/bin/env pwsh

$BASH_PATH = "$HOME\.bashrc"
$BASH_TARGET = "$PWD\bash\.bashrc"

if (Test-Path -Path $BASH_PATH) {
    if (!(Get-Item $BASH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of .bashrc to .bashrc.old..." -ForegroundColor Blue
        Rename-Item -Path $BASH_PATH -NewName ".bashrc.old"

        Write-Host "Linking: $BASH_TARGET->$BASH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $BASH_PATH -Target $BASH_TARGET -Force
    }
}
else {
    Write-Host "Linking: $BASH_TARGET->$BASH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $BASH_PATH -Target $BASH_TARGET -Force
}

if (!(((Get-Item -Path $BASH_PATH -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $BASH_PATH -Force).Attributes += "Hidden"
}

$BASH_PATH = "$HOME\.bash_profile"
$BASH_TARGET = "$PWD\bash\.bash_profile"

if (Test-Path -Path $BASH_PATH) {
    if (!(Get-Item $BASH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of .bash_profile to .bash_profile.old..." -ForegroundColor Blue
        Rename-Item -Path $BASH_PATH -NewName ".bash_profile.old"

        Write-Host "Linking: $BASH_TARGET->$BASH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $BASH_PATH -Target $BASH_TARGET -Force
    }
}
else {
    Write-Host "Linking: $BASH_TARGET->$BASH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $BASH_PATH -Target $BASH_TARGET -Force
}

if (!(((Get-Item -Path $BASH_PATH -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path $BASH_PATH -Force).Attributes += "Hidden"
}
