#!/usr/bin/env pwsh

If (-not (test-path "$HOME/.ssh")) { mkdir "$HOME/.ssh" }
if (!(((Get-Item -Path "$HOME/.ssh" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.ssh" -Force).Attributes += "Hidden"
}

$SSH_PATH = "$HOME\.ssh\id_rsa"
$SSH_TARGET = "$PWD\ssh\id_rsa"

if (Test-Path -Path $SSH_PATH) {
    if (!(Get-Item $SSH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of id_rsa to id_rsa.old..." -ForegroundColor Blue
        Rename-Item -Path $SSH_PATH -NewName "id_rsa.old"

        Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
}

$SSH_PATH = "$HOME\.ssh\id_rsa.pub"
$SSH_TARGET = "$PWD\ssh\id_rsa.pub"

if (Test-Path -Path $SSH_PATH) {
    if (!(Get-Item $SSH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of id_rsa.pub to id_rsa.pub.old..." -ForegroundColor Blue
        Rename-Item -Path $SSH_PATH -NewName "id_rsa.pub.old"

        Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
}

$SSH_PATH = "$HOME\.ssh\known_hosts"
$SSH_TARGET = "$PWD\ssh\known_hosts"

if (Test-Path -Path $SSH_PATH) {
    if (!(Get-Item $SSH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of known_hosts to known_hosts.old..." -ForegroundColor Blue
        Rename-Item -Path $SSH_PATH -NewName "known_hosts.old"

        Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
}

$SSH_PATH = "$HOME\.ssh\config"
$SSH_TARGET = "$PWD\ssh\config"

if (Test-Path -Path $SSH_PATH) {
    if (!(Get-Item $SSH_PATH -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing name of config to config.old..." -ForegroundColor Blue
        Rename-Item -Path $SSH_PATH -NewName "config.old"

        Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
    }
}
else {
    Write-Host "Linking: $SSH_TARGET->$SSH_PATH..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path $SSH_PATH -Target $SSH_TARGET -Force | Out-Null
}
