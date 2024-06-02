#!/usr/bin/env pwsh

# Install git
if (!(where.exe git)) {
    # TODO: Allow interactive, see issue #8
    winget install Git.Git --scope=machine --architecture=x64
}

# Create related directories
New-Directory -Path "$HOME\.config\git"

# Create softlink to 'config'.
Set-Softlink -Path "$HOME\.config\git\config" -Target "$PSScriptRoot\config"

# Create softlink to 'gitconfig'.
Set-Softlink -Path "$env:programfiles\git\etc\gitconfig" -Target "$PSScriptRoot\gitconfig"

# Create softlink to '.gitignore'.
Set-Softlink -Path "$HOME\.config\git\.gitignore" -Target "$PSScriptRoot\.gitignore"

# Create softlink to '.gitattributes'.
Set-Softlink -Path "$HOME\.config\git\.gitattributes" -Target "$PSScriptRoot\.gitattributes"

# Create softlink to '.gitmessage'.
Set-Softlink -Path "$HOME\.config\git\.gitmessage" -Target "$PSScriptRoot\.gitmessage"
