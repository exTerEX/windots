#!/usr/bin/env pwsh
#!/usr/bin/env pwsh

# Install
winget install XP89DCGQ3K6VLD --accept-package-agreements --accept-source-agreements

# Remove previous settings file
Remove-Item -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Force

# Create softlink to 'PowerToys'.
Set-Softlink -Path "$ENV:LOCALAPPDATA\Microsoft\PowerToys" -Target "$PSScriptRoot\Powertoys" -Hide
