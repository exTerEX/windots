#!/usr/bin/env pwsh

# Install VSCode
if (!(where.exe code)) {
    winget install Microsoft.VisualStudioCode --scope "machine" --architecture x64
}

# Create softlink to 'settings.json'.
Set-Softlink -Path "$env:appdata\Code\User\settings.json" -Target "$PSScriptRoot\settings.json"

# Install packages
code --install-extension docsmsft.docs-markdown
code --install-extension tamasfe.even-better-toml
code --install-extension grapecity.gc-excelviewer
code --install-extension miguelsolorio.fluent-icons
code --install-extension github.remotehub
code --install-extension github.github-vscode-theme
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-toolsai.jupyter
code --install-extension james-yu.latex-workshop
code --install-extension ms-vscode.powershell
code --install-extension esbenp.prettier-vscode
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ikuyadeu.r
code --install-extension mechatroner.rainbow-csv
