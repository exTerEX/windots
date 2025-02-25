#!/usr/bin/env pwsh

# Install NuGet
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Install OMP
if (!(where.exe oh-my-posh)) {
    winget install JanDeDobbeleer.OhMyPosh --scope=machine --architecture=x64
}

# FIXME: Hopefully will restart the shell to enable oh-my-posh
Get-Process -Id $PID | Select-Object -ExpandProperty Path | ForEach-Object { Invoke-Command { & "$_" } -NoNewScope }

# Install Cascadia code font for OMP
oh-my-posh font install CascadiaCode
