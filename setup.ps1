Write-Host "Setting up System..." -ForegroundColor Blue

$launch_pwd = $PWD
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
If (-not (test-path "$HOME/Documents/WindowsPowerShell")) { mkdir "$HOME/Documents/WindowsPowerShell" }

If (-not (test-path "$HOME/.aws")) { mkdir "$HOME/.aws" }
if (!(((Get-Item -Path "$HOME/.aws" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.aws" -Force).Attributes += "Hidden"
}

If (-not (test-path "$HOME/.azure")) { mkdir "$HOME/.azure" }
if (!(((Get-Item -Path "$HOME/.azure" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.azure" -Force).Attributes += "Hidden"
}

If (-not (test-path "$HOME/.config")) { mkdir "$HOME/.config" }
if (!(((Get-Item -Path "$HOME/.config" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.config" -Force).Attributes += "Hidden"
}

# Powershell profile
if (Test-Path -Path "$HOME/Documents/WindowsPowerShell/profile.ps1") {
    if (!(Get-Item "$HOME/Documents/WindowsPowerShell/profile.ps1" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing profile.ps1 with symbolic link to $PWD/powershell/profile.ps1..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/Documents/WindowsPowerShell/profile.ps1" -Target "$PWD/powershell/profile.ps1" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/powershell/profile.ps1..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/Documents/WindowsPowerShell/profile.ps1" -Target "$PWD/powershell/profile.ps1" -Force
}

# Anaconda / Miniconda
if (Test-Path -Path "$HOME/.condarc") {
    if (!(Get-Item "$HOME/.condarc" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.condarc..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.condarc" -Target "$PWD/miniconda/.condarc" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/.condarc..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.condarc" -Target "$PWD/miniconda/.condarc" -Force
}

if (!(((Get-Item -Path "$HOME/.condarc" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.condarc" -Force).Attributes += "Hidden"
}

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
if (Test-Path -Path "$HOME/.config/scoop/config.json") {
    if (!(Get-Item "$HOME/.config/scoop/config.json" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/$HOME/.config/scoop/config.json..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.config/scoop/config.json" -Target "$PWD/scoop/config.json" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/scoop/config.json..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.config/scoop/config.json" -Target "$PWD/scoop/config.json" -Force
}

#Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
# TODO: Check if program is installed, run "scoop update" instead

#scoop install git-crypt

if (!(((Get-Item -Path "$HOME/scoop" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/scoop" -Force).Attributes += "Hidden"
}

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

# pymol
If (-not (test-path "$HOME/.pymol")) { mkdir "$HOME/.pymol" }
if (!(((Get-Item -Path "$HOME/.pymol" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.pymol" -Force).Attributes += "Hidden"
}

If (-not (test-path "$HOME/.pymol/cache")) { mkdir "$HOME/.pymol/cache" }
If (-not (test-path "$HOME/.pymol/scripts")) { mkdir "$HOME/.pymol/scripts" }

if (Test-Path -Path "$HOME/pymolrc.pml") {
    if (!(Get-Item "$HOME/pymolrc.pml" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/pymol/pymolrc.pml..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/pymolrc.pml" -Target "$PWD/pymol/pymolrc.pml" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/pymol/pymolrc.pml..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/pymolrc.pml" -Target "$PWD/pymol/pymolrc.pml" -Force
}

if (!(((Get-Item -Path "$HOME/pymolrc.pml" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/pymolrc.pml" -Force).Attributes += "Hidden"
}

Set-Location "$HOME/.pymol/scripts"
git clone "https://github.com/exTerEX/pymol-ramachandran.git"
Set-Location $launch_pwd

# TODO: Install "matplotlib" to PyMol's conda environment at setup

# SSH
If (-not (test-path "$HOME/.ssh")) { mkdir "$HOME/.ssh" }
if (!(((Get-Item -Path "$HOME/.ssh" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/.ssh" -Force).Attributes += "Hidden"
}

if (Test-Path -Path "$HOME/.ssh/id_ed25519") {
    if (!(Get-Item "$HOME/.ssh/id_ed25519" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/ssh/id_ed25519..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.ssh/id_ed25519" -Target "$PWD/ssh/id_ed25519" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/ssh/id_ed25519..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.ssh/id_ed25519" -Target "$PWD/ssh/id_ed25519" -Force
}

if (Test-Path -Path "$HOME/.ssh/id_ed25519.pub") {
    if (!(Get-Item "$HOME/.ssh/id_ed25519.pub" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/ssh/id_ed25519.pub..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$HOME/.ssh/id_ed25519.pub" -Target "$PWD/ssh/id_ed25519.pub" -Force
    }
}
else {
    Write-Host "Symolic link to $PWD/ssh/id_ed25519.pub..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$HOME/.ssh/id_ed25519.pub" -Target "$PWD/ssh/id_ed25519.pub" -Force
}

# GPG

# scoop
