#!/usr/bin/env pwsh

# Install OMP
if (!(where.exe oh-my-posh)) {
    # TODO: Allow interactive, see issue #8
    winget install JanDeDobbeleer.OhMyPosh --scope=machine --architecture=x64
}

# Install Cascadia code font for OMP
oh-my-posh font install CascadiaCode
