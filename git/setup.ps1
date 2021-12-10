#!/usr/bin/env pwsh

# Create related directories
New-Directory -Path "$HOME\.config\git"

$BASEPATH = "$HOME\.config\git"

# Create softlink to '.gitconfig' and hide it.
Set-Softlink -Path "$HOME\.gitconfig" -Target "$PSScriptRoot\.gitconfig" -Hide

# Create softlink to '.gitignore' and hide it.
Set-Softlink -Path "$BASEPATH\.gitignore" -Target "$PSScriptRoot\.gitignore"

# Create softlink to '.gitattributes' and hide it.
Set-Softlink -Path "$BASEPATH\.gitattributes" -Target "$PSScriptRoot\.gitattributes"

# Create softlink to '.gitmessage' and hide it.
Set-Softlink -Path "$BASEPATH\.gitmessage" -Target "$PSScriptRoot\.gitmessage"
