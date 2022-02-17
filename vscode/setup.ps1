#!/usr/bin/env pwsh

# Install VSCode
$PATH = "$env:programfiles\Microsoft Visual Studio\Code"
New-Directory -Path $PATH
if (!(where.exe code)) {
    winget install Microsoft.VisualStudioCode -a x64 -s machine -l $PATH
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
code --install-extension gruntfuggly.todo-tree
code --install-extension editorconfig.editorconfig
