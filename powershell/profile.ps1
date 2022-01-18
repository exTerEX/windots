# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# Disable the Progress Bar
$ProgressPreference = "SilentlyContinue"

# Basic commands
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Sudo
function sudo() {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

# Determine size of a file or total size of a directory
function Get-DiskUsage([string] $path = (Get-Location).Path) {
    Convert-ToDiskSize `
    ( `
            Get-ChildItem .\ -recurse -ErrorAction SilentlyContinue `
        | Measure-Object -property length -sum -ErrorAction SilentlyContinue
    ).Sum `
        1
}

# Import posh-git
Import-Module posh-git

# Import oh-my-posh
Import-Module oh-my-posh

# Set oh-my-posh theme
Set-PoshPrompt -Theme craver
