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
function Create-Dir {
    param ([Parameter(Mandatory)][string]$Path, [switch]$NoHide)

    PROCESS {
        If (-not (test-path $Path)) { mkdir $Path }

        if (!($NoHide)) {
            if (!(((Get-Item -Path $Path -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
                (Get-Item -Path $Path -Force).Attributes += "Hidden"
            }
        }
    }
}

function Create-Softlink {
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

        if ($Hide) {
            if (!(((Get-Item -Path $Path -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
                (Get-Item -Path $Path -Force).Attributes += "Hidden"
            }
        }
    }
}

# Trust PSrepository
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Create directories
Create-Dir -Path "$HOME\.aws"
Create-Dir -Path "$HOME\.azure"
Create-Dir -Path "$HOME\repo" -NoHide

# Scoop
Invoke-Expression -Command "$PSScriptRoot\scoop\setup.ps1" | Invoke-Expression

# Winget
Invoke-Expression -Command "$PSScriptRoot\winget\setup.ps1" | Invoke-Expression

# SSH
Invoke-Expression -Command "$PSScriptRoot\ssh\setup.ps1" | Invoke-Expression

# Powershell
Invoke-Expression -Command "$PSScriptRoot\powershell\setup.ps1" | Invoke-Expression

# Anaconda / Miniconda
Invoke-Expression -Command "$PSScriptRoot\conda\setup.ps1" | Invoke-Expression

# pymol
Invoke-Expression -Command "$PSScriptRoot\pymol\setup.ps1" | Invoke-Expression

# Git
Invoke-Expression -Command "$PSScriptRoot\git\setup.ps1" | Invoke-Expression

# Bash
Invoke-Expression -Command "$PSScriptRoot\bash\setup.ps1" | Invoke-Expression

# WSL
Invoke-Expression -Command "$PSScriptRoot\wsl\setup.ps1" | Invoke-Expression

# Windows terminal
Invoke-Expression -Command "$PSScriptRoot\terminal\setup.ps1" | Invoke-Expression

# GPG

Write-Host "Setup finished." -ForegroundColor Green
