#!/usr/bin/env pwsh

# Install PowerToys
if (!(where.exe powertoys)) {
    winget install --id Microsoft.PowerToys --source winget
}
