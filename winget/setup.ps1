#!/usr/bin/env pwsh

$WINGET_PATH = "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json"
$WINGET_TARGET = "$PWD\winget\settings.json"

if (Test-Path -Path $WINGET_PATH) {
    if (!(Get-Item $WINGET_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of settings.json to settings.json.old..." -ForegroundColor Blue
        Rename-Item -Path $WINGET_PATH -NewName "settings.json.old"

        Write-Host "Linking: $WINGET_TARGET->$WINGET_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $WINGET_PATH -Target $WINGET_TARGET -Force
    }
}
else {
    Write-Host "Linking: $WINGET_TARGET->$WINGET_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $WINGET_PATH -Target $WINGET_TARGET -Force
}
