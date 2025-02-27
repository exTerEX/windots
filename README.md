# Windows dotfiles

> **IMPORTANT!**: Dotfile repository intended for personal use. Code is available for others to use, but most settings are personalized.

The dotfiles contain configuration for many different programs, and settings used in Windows 10/11. The setup script included install most programs, not included by default in Windows 10/11, that has a configuration in this repository. All subfolders has a `setup.ps1` script installing related programs and linking all configuration files. A main script in the root of this repository contain functions used in all following scripts and activate all following scripts handling the installation.

## Setup

## Directory structure

The repository follows a straight forward folder structure. For clearification each subdirectory and important file is explained in the table under.

|       Folder | Description                                             |
| -----------: | :------------------------------------------------------ |
|    _.vscode_ | Project configuration for Visual Studio Code.           |
|        _git_ | Configuration files related to git.                     |
|        _gpg_ | Key, configuration and setup files for gpg.             |
| _powershell_ | Configuration and setup files related to powershell.    |
|  _powertoys_ | Configuration and setup files related to powertoys.     |
|        _ssh_ | Key and configuration files related to ssh.             |
|   _terminal_ | Configuration files related to Windows terminal.        |
|    _windows_ | Configuration related to Windows.                       |
|        _wsl_ | Configuration files related to Windows-side WSL.        |
|  _setup.ps1_ | Main setup script.                                      |

## Authors

- _Andreas Sagen_ - Maintainer

This project does not currently accept commits from non-authors. Feel free to fork and make it your own, or use configuration files and/or ideas from this project, freely.

## License

This project is licensed under `Unlicense`. For more details see [LICENSE](LICENSE).

## Acknowledgments

- [jimbrig/jimsdots](https://github.com/jimbrig/jimsdots) for the inspiration to this project.
- [ayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows) for specific implementation and settings.
