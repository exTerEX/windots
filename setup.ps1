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

If (-not (test-path "$HOME/repo")) { mkdir "$HOME/repo" }
if (!(((Get-Item -Path "$HOME/repo" -Force).Attributes.ToString() -Split ", ") -Contains "Hidden")) {
    (Get-Item -Path "$HOME/repo" -Force).Attributes += "Hidden"
}

# Scoop
Invoke-Expression -Command "$PWD\scoop\setup.ps1" | Invoke-Expression

# Winget
Invoke-Expression -Command "$PWD\winget\setup.ps1" | Invoke-Expression

# SSH
Invoke-Expression -Command "$PWD\ssh\setup.ps1" | Invoke-Expression

# Powershell
Invoke-Expression -Command "$PWD\powershell\setup.ps1" | Invoke-Expression

# Anaconda / Miniconda
Invoke-Expression -Command "$PWD\conda\setup.ps1" | Invoke-Expression

# pymol
Invoke-Expression -Command "$PWD\pymol\setup.ps1" | Invoke-Expression
Set-Location $PSScriptRoot

# Git
Invoke-Expression -Command "$PWD\git\setup.ps1" | Invoke-Expression

# Bash
Invoke-Expression -Command "$PWD\bash\setup.ps1" | Invoke-Expression

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

# GPG
