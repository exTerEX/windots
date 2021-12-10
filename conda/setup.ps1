#!/usr/bin/env pwsh

# Install Anaconda
if (!(where.exe conda)) {
    winget install Anaconda.Anaconda3 --architecture=x64
}

# Create softlink to '.condarc' and hide it.
Set-Softlink -Path "$HOME\.condarc" -Target "$PSScriptRoot\.condarc" -Hide
