#!/usr/bin/env pwsh

# Install Miniconda
if (!(where.exe conda)) {
    winget install Anaconda.Miniconda3 --scope=user --architecture=x64
}

# Create softlink to '.condarc' and hide it.
Set-Softlink -Path "$HOME\.condarc" -Target "$PSScriptRoot\.condarc" -Hide
