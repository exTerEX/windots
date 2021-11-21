#!/usr/bin/env pwsh

# Create softlink to '.condarc' and hide it.
Create-Softlink -Path "$HOME\.condarc" -Target "$PSScriptRoot\.condarc" -Hide
