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
If (-not (test-path "~/Documents/WindowsPowerShell")) { mkdir "~/Documents/WindowsPowerShell" }

If (-not (test-path "~/.aws")) { mkdir "~/.aws" }
if (!(((Get-Item -Path "~/.aws" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.aws" -Force).Attributes += "Hidden"
}

If (-not (test-path "~/.azure")) { mkdir "~/.azure" }
if (!(((Get-Item -Path "~/.azure" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.azure" -Force).Attributes += "Hidden"
}

If (-not (test-path "~/.config")) { mkdir "~/.config" }
if (!(((Get-Item -Path "~/.config" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.config" -Force).Attributes += "Hidden"
}

# Powershell profile
if (Test-Path -Path "~/Documents/WindowsPowerShell/profile.ps1") {
    if (!(Get-Item "~/Documents/WindowsPowerShell/profile.ps1" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing profile.ps1 with symbolic link to $PWD/powershell/profile.ps1..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/Documents/WindowsPowerShell/profile.ps1" -Target "$PWD/powershell/profile.ps1" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/powershell/profile.ps1..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/Documents/WindowsPowerShell/profile.ps1" -Target "$PWD/powershell/profile.ps1" -Force
}

# Anaconda / Miniconda
if (Test-Path -Path "~/.condarc") {
    if (!(Get-Item "~/.condarc" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.condarc..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.condarc" -Target "$PWD/miniconda/.condarc" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/.condarc..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.condarc" -Target "$PWD/miniconda/.condarc" -Force
}

if (!(((Get-Item -Path "~/.condarc" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.condarc" -Force).Attributes += "Hidden"
}

# WSL
if (Test-Path -Path "~/.wslconfig") {
    if (!(Get-Item "~/.wslconfig" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.wslconfig..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.wslconfig" -Target "$PWD/wsl/windows/.wslconfig" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/.wslconfig..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.wslconfig" -Target "$PWD/wsl/windows/.wslconfig" -Force
}

if (!(((Get-Item -Path "~/.wslconfig" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.wslconfig" -Force).Attributes += "Hidden"
}

# Git
if (Test-Path -Path "~/.gitconfig") {
    if (!(Get-Item "~/.gitconfig" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.gitconfig..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.gitconfig" -Target "$PWD/git/.gitconfig" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/.gitconfig..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.gitconfig" -Target "$PWD/git/.gitconfig" -Force
}

if (!(((Get-Item -Path "~/.gitconfig" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.gitconfig" -Force).Attributes += "Hidden"
}

# Bash
if (Test-Path -Path "~/.bashrc") {
    if (!(Get-Item "~/.bashrc" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.bashrc..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.bashrc" -Target "$PWD/bash/.bashrc" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/.bashrc..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.bashrc" -Target "$PWD/bash/.bashrc" -Force
}

if (!(((Get-Item -Path "~/.bashrc" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.bashrc" -Force).Attributes += "Hidden"
}

if (Test-Path -Path "~/.bash_profile") {
    if (!(Get-Item "~/.bash_profile" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/.bash_profile..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.bash_profile" -Target "$PWD/bash/.bash_profile" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/.bash_profile..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.bash_profile" -Target "$PWD/bash/.bash_profile" -Force
}

if (!(((Get-Item -Path "~/.bash_profile" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.bash_profile" -Force).Attributes += "Hidden"
}

# Scoop
if (Test-Path -Path "~/.config/scoop/config.json") {
    if (!(Get-Item "~/.config/scoop/config.json" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/~/.config/scoop/config.json..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/.config/scoop/config.json" -Target "$PWD/scoop/config.json" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/scoop/config.json..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/.config/scoop/config.json" -Target "$PWD/scoop/config.json" -Force
}

#Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
# TODO: Check if program is installed, run "scoop update" instead

#scoop install git-crypt

if (!(((Get-Item -Path "~/scoop" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/scoop" -Force).Attributes += "Hidden"
}

# Winget
if (Test-Path -Path "~/") {
    if (!(Get-Item "~/" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/winget/settings.json..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PWD/winget/settings.json" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/winget/settings.json..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$PWD/winget/settings.json" -Force
}

# pymol
If (-not (test-path "~/.pymol")) { mkdir "~/.pymol" }
if (!(((Get-Item -Path "~/.pymol" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/.pymol" -Force).Attributes += "Hidden"
}

If (-not (test-path "~/.pymol/cache")) { mkdir "~/.pymol/cache" }
If (-not (test-path "~/.pymol/scripts")) { mkdir "~/.pymol/scripts" }

if (Test-Path -Path "~/pymolrc.pml") {
    if (!(Get-Item "~/pymolrc.pml" -Force).LinkType -eq "SymbolicLink") {
        Write-Host "Changing file to a symbolic link to $PWD/pymol/pymolrc.pml..." -ForegroundColor Blue
        New-Item -ItemType SymbolicLink -Path "~/pymolrc.pml" -Target "$PWD/pymol/pymolrc.pml" -Force
    }
} else {
    Write-Host "Symolic link to $PWD/pymol/pymolrc.pml..." -ForegroundColor Blue
    New-Item -ItemType SymbolicLink -Path "~/pymolrc.pml" -Target "$PWD/pymol/pymolrc.pml" -Force
}

if (!(((Get-Item -Path "~/pymolrc.pml" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "~/pymolrc.pml" -Force).Attributes += "Hidden"
}

cd "~/.pymol/scripts"
git clone "https://github.com/exTerEX/pymol-ramachandran.git"
cd $launch_pwd

# TODO: Install "matplotlib" to PyMol's conda environment at setup

# SSH

# scoop
