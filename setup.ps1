#Requires -Version 5

#$erroractionpreference = "stop" # quit if anything goes wrong

if (($PSVersionTable.PSVersion.Major) -lt 5) {
    Write-Output "PowerShell 5 or later is required to run."
    break
}

$isadmin = (new-object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole("Administrators")
if (-not ($isadmin)) { throw "Must have Admininstrative Priveledges..." }

Write-Host "Setting up System..." -ForegroundColor Blue

# Set execution policy
$exepolicy = Get-ExecutionPolicy
if ($exepolicy -ne "Unrestricted") {
    Write-Host "Setting Execution Policy to Unrestricted" -ForegroundColor Blue
    Set-ExecutionPolicy Unrestricted -scope CurrentUser
    Set-ExecutionPolicy Unrestricted
}

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
        If (!(test-path $Path)) { mkdir $Path }

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

function Get-Zip {
    param ([parameter(Mandatory)][string]$Uri, [string]$DestinationPath = "$HOME/Downloads", [switch]$Extract)

    PROCESS {
        $ZippedFilePath = "$DestinationPath\$(Split-Path -Path $Uri -Leaf)"

        $FileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($ZippedFilePath)

        # TODO: Switch statement to control local cache behaviour
        # Use local copy if available
        if (!(Test-Path -Path $ZippedFilePath)) {
            Write-Host "Using local available cache for package: $FileNameWithoutExtension..." -ForegroundColor Blue
            Invoke-WebRequest -Uri $Uri -OutFile $ZippedFilePath
        }

        if ($Extract) {
            $ExtractPath = "$DestinationPath\$FileNameWithoutExtension"

            Expand-Archive -LiteralPath $ZippedFilePath -DestinationPath $ExtractPath

            return $ExtractPath
        }
    }
}

# Trust PSrepository
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Create directories
New-Directory -Path "$HOME\.aws" -Hide
New-Directory -Path "$HOME\.azure" -Hide
New-Directory -Path "$HOME\repo"
New-Directory -Path "$HOME\.config" -Hide

# Scoop
Invoke-Expression -Command "$PSScriptRoot\scoop\setup.ps1"

# Winget
Invoke-Expression -Command "$PSScriptRoot\winget\setup.ps1"

# Visual Studio Code
Invoke-Expression -Command "$PSScriptRoot\vscode\setup.ps1"

# Git
Invoke-Expression -Command "$PSScriptRoot\git\setup.ps1"

# SSH
Invoke-Expression -Command "$PSScriptRoot\ssh\setup.ps1"

# Powershell
Invoke-Expression -Command "$PSScriptRoot\powershell\setup.ps1"

# Anaconda / Miniconda
Invoke-Expression -Command "$PSScriptRoot\conda\setup.ps1"

# pymol
Invoke-Expression -Command "$PSScriptRoot\pymol\setup.ps1"

# Bash
Invoke-Expression -Command "$PSScriptRoot\bash\setup.ps1"

# WSL
Invoke-Expression -Command "$PSScriptRoot\wsl\setup.ps1"

# Windows terminal
Invoke-Expression -Command "$PSScriptRoot\terminal\setup.ps1"

# GnuPG
Invoke-Expression -Command "$PSScriptRoot\gnupg\setup.ps1"

# GPG
Invoke-Expression -Command "$PSScriptRoot\gpg\setup.ps1"

# R
Invoke-Expression -Command "$PSScriptRoot\R\setup.ps1"

Write-Host "Setup finished." -ForegroundColor Green
