#!/usr/bin/env pwsh

# Create directory 'scoop' in users home directory and hide it. This is
# the directory where Scoop install itself, and other programs for the user.
New-Directory -Path "$HOME\scoop" -Hide

# Create softlink to the Scoop configuration file to keep specific settings,
# and Scoop version settings.
$Path = "$HOME\.config\scoop\config.json"
$Target = "$PSScriptRoot\config.json"
Set-Softlink -Path $Path -Target $Target

# Install scoop
$Uri = "https://get.scoop.sh"
if (!(where.exe scoop)) {
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString($Uri)
}

# Install programs regularily used are installed if not already installed.
if (!(where.exe scoop)) { scoop install git-crypt }
if (!(where.exe 7zip)) { scoop install 7zip }
if (!(where.exe curl)) { scoop install curl }

# Some files are generated when installing Scoop. These are hidden, if in
# the users home directory.
Hide-File "$HOME\.lesshst"
