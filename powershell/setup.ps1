#!/usr/bin/env pwsh

$PWSH_PATH = "C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1"
$PWSH_TARGET = "$PWD\powershell\profile.ps1"

if (Test-Path -Path $PWSH_PATH) {
    if (!(Get-Item $PWSH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of profile.ps1 to profile.ps1.old..."
        Rename-Item -Path $PWSH_PATH -NewName "profile.ps1.old"

        Write-Host "Changing profile.ps1 with symbolic link: $PWSH_TARGET->$PWSH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $PWSH_PATH -Target $PWSH_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Creating symbolic link: $PWSH_TARGET->$PWSH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $PWSH_PATH -Target $PWSH_TARGET -Force | Out-Null
}
