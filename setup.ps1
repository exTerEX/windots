#Requires -Version 5

if (($PSVersionTable.PSVersion.Major) -lt 5) {
    Write-Output "PowerShell 5 or later is required to run."
    break
}

$isadmin = (new-object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole("Administrators")
if (-not ($isadmin)) { throw "Must have Admininstrative Priveledges..." }

Write-Host "Configuring System..." -ForegroundColor "Yellow"

# Custom functions
function Hide-File {
    param([Parameter(Mandatory)][string]$Path)

    if (!(((Get-Item -Path $Path -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
        (Get-Item -Path $Path -Force).Attributes += "Hidden"
    }
}

function New-Directory {
    param ([Parameter(Mandatory)][string]$Path, [switch]$Hide)

    PROCESS {
        If (!(test-path $Path)) {
            New-Item -Path $Path -ItemType "directory" | Out-Null
        }

        if ($Hide) { Hide-File($Path) }
    }
}

function Set-Softlink {
    param ([Parameter(Mandatory)][string]$Path, [Parameter(Mandatory)][string]$Target, [switch]$Hide)

    PROCESS {
        if (Test-Path -Path $Path) {
            if (!(Get-Item $Path -Force).LinkType -eq "SymbolicLink") {
                Write-Host "Old file renamed to $((Get-Item -Path $Path).Name).old..." -ForegroundColor Blue
                Rename-Item -Path $Path -NewName "$((Get-Item -Path $Path).Name).old"

                Write-Host "Linking: $Target->$Path..." -ForegroundColor Blue
                New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force | Out-Null
            }
        }
        else {
            Write-Host "Linking: $Target->$Path..." -ForegroundColor Blue
            New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force | Out-Null
        }

        if ($Hide) { Hide-File($Path) }
    }
}

function Find-Installed( $programName ) {
    $x86_check = ((Get-ChildItem "HKLM:Software\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_."Name" -like "*$programName*" } ).Length -gt 0;

    if (Test-Path 'HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall') {
        $x64_check = ((Get-ChildItem "HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
            Where-Object { $_."Name" -like "*$programName*" } ).Length -gt 0;
    }
    return $x86_check -or $x64_check;
}

# Trust PSrepository
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Create directories
New-Directory -Path "$HOME\repo"
New-Directory -Path "$HOME\.config" -Hide

# Windows
Invoke-Expression -Command "$PSScriptRoot\windows\setup.ps1"

# Visual Studio Code
Invoke-Expression -Command "$PSScriptRoot\vscode\setup.ps1"

# Git
Invoke-Expression -Command "$PSScriptRoot\git\setup.ps1"

# Powershell
Invoke-Expression -Command "$PSScriptRoot\powershell\setup.ps1"

# PowerToys
Invoke-Expression -Command "$PSScriptRoot\powertoys\setup.ps1"

# WSL
Invoke-Expression -Command "$PSScriptRoot\wsl\setup.ps1"

# Windows terminal
Invoke-Expression -Command "$PSScriptRoot\terminal\setup.ps1"

# GPG
Invoke-Expression -Command "$PSScriptRoot\gpg\setup.ps1"

Write-Host "Setup finished." -ForegroundColor Green
