Write-Host "Setting up System..." -ForegroundColor Blue

$isadmin = (new-object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole("Administrators")
if (-not ($isadmin)) { throw "Must have Admininstrative Priveledges..." }

# Set execution policy
$exepolicy = Get-ExecutionPolicy
if ($exepolicy -ne "Unrestricted") {
    Write-Host "Setting Execution Policy to Unrestricted" -ForegroundColor Blue
    Set-ExecutionPolicy Unrestricted -scope CurrentUser
    Set-ExecutionPolicy Unrestricted
}

# Trust PSrepository
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Create directories
If (-not (test-path "$HOME/.aws")) { mkdir "$HOME/.aws" }
if (!(((Get-Item -Path "$HOME/.aws" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.aws" -Force).Attributes += "Hidden"
}

If (-not (test-path "$HOME/.azure")) { mkdir "$HOME/.azure" }
if (!(((Get-Item -Path "$HOME/.azure" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.azure" -Force).Attributes += "Hidden"
}

# SSH
Invoke-Expression -Command "$PWD\ssh\setup.ps1" | Invoke-Expression

# Setup Powershell profile
Invoke-Expression -Command "$PWD\powershell\setup.ps1" | Invoke-Expression

# Anaconda / Miniconda
Invoke-Expression -Command "$PWD\conda\setup.ps1" | Invoke-Expression

# pymol
Invoke-Expression -Command "$PWD\pymol\setup.ps1" | Invoke-Expression

# WSL
if (Test-Path -Path "$HOME/.wslconfig") {
    if (!(Get-Item "$HOME/.wslconfig" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.wslconfig..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.wslconfig" -Target "$PWD/wsl/windows/.wslconfig" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/.wslconfig..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.wslconfig" -Target "$PWD/wsl/windows/.wslconfig" -Force
}

if (!(((Get-Item -Path "$HOME/.wslconfig" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.wslconfig" -Force).Attributes += "Hidden"
}

# Git
if (Test-Path -Path "$HOME/.gitconfig") {
    if (!(Get-Item "$HOME/.gitconfig" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.gitconfig..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.gitconfig" -Target "$PWD/git/.gitconfig" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/.gitconfig..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.gitconfig" -Target "$PWD/git/.gitconfig" -Force
}

if (!(((Get-Item -Path "$HOME/.gitconfig" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.gitconfig" -Force).Attributes += "Hidden"
}

# Bash
if (Test-Path -Path "$HOME/.bashrc") {
    if (!(Get-Item "$HOME/.bashrc" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.bashrc..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.bashrc" -Target "$PWD/bash/.bashrc" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/.bashrc..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.bashrc" -Target "$PWD/bash/.bashrc" -Force
}

if (!(((Get-Item -Path "$HOME/.bashrc" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.bashrc" -Force).Attributes += "Hidden"
}

if (Test-Path -Path "$HOME/.bash_profile") {
    if (!(Get-Item "$HOME/.bash_profile" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.bash_profile..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.bash_profile" -Target "$PWD/bash/.bash_profile" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/.bash_profile..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.bash_profile" -Target "$PWD/bash/.bash_profile" -Force
}

if (!(((Get-Item -Path "$HOME/.bash_profile" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.bash_profile" -Force).Attributes += "Hidden"
}

# Scoop
Invoke-Expression -Command "$PWD\scoop\setup.ps1" | Invoke-Expression

# Winget
if (Test-Path -Path "$HOME/") {
    if (!(Get-Item "$HOME/" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/winget/settings.json..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PWD/winget/settings.json" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/winget/settings.json..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PWD/winget/settings.json" -Force
}

# TODO: Install "matplotlib" to PyMol's conda environment at setup

# GPG

# scoop
