# Load Oh-My-Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\default.omp.json" | Invoke-Expression

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
