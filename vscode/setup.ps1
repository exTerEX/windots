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
if (where.exe code) {
    code --install-extension ms-vscode-remote.remote-containers
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension github.codespaces
    code --install-extension github.copilot
    code --install-extension github.copilot-chat
    code --install-extension github.vscode-github-actions
    code --install-extension ms-toolsai.jupyter-keymap
    code --install-extension ms-vscode.live-server
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode-remote.remote-ssh
    code --install-extension ms-vscode-remote.remote-ssh-edit
    code --install-extension ms-vscode.remote-explorer
    code --install-extension ms-vscode-remote.remote-wsl
    code --install-extension gruntfuggly.todo-tree
}
