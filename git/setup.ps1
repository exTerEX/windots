#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.git" -Hide

# Create softlink to '.gitconfig' and hide it.
Set-Softlink -Path "$HOME\.gitconfig" -Target "$PSScriptRoot\.gitconfig" -Hide

# Create softlink to '.gitignore' and hide it.
Set-Softlink -Path "$HOME\.git\.gitignore" -Target "$PSScriptRoot\.gitignore" -Hide

# Create softlink to '.gitattributes' and hide it.
Set-Softlink -Path "$HOME\.git\.gitattributes" -Target "$PSScriptRoot\.gitattributes" -Hide

# Create softlink to '.gitmessage' and hide it.
Set-Softlink -Path "$HOME\.giot\.gitmessage" -Target "$PSScriptRoot\.gitmessage" -Hide
