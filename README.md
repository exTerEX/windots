# Windows dotfiles

> **IMPORTANT!**: Dotfile repository intended for personal use. Code is available for others to use, but most settings are personalized. Certain files in this repository is encrypted like ssh keys, certifications, etc. with `git-crypt`.

The dotfiles contain configuration for many different programs, and settings used in Windows 10. The setup script included install most programs, not included by default in Windows 10, that has a configuration in this repository. All subfolders has a `setup.ps1` script installing related programs and linking all configuration files. A main script in the root of this repository contain functions used in all following scripts and activate all following scripts handling the installation.

## Setup

## Directory structure

The repository follows a straight forward folder structure. For clearification each subdirectory and important file is explained in the table under.

|       Folder | Description                                             |
| -----------: | :------------------------------------------------------ |
|       _bash_ | Configuration files related to git-for-windows bash.    |
|      _conda_ | Configuration files related to ana- and miniconda.      |
|        _git_ | Configuration files related to git.                     |
|        _gpg_ | Key and configuration files for gpg.                    |
| _powershell_ | Configuration files related to powershell.              |
|      _pymol_ | Configuration and certification files related to pymol. |
|      _scoop_ | Configuration files related to scoop package manager.   |
|        _ssh_ | Key and configuration files related to ssh.             |
|   _terminal_ | Configuration files related to Windows terminal.        |
|     _winget_ | Configuration files related to WinGet.                  |
|        _wsl_ | Configuration files related to Windows-side WSL.        |
|  _setup.ps1_ | Main setup script.                                      |

## Encrypted secrets

All secrets in this repository are encrypted and locked as binaries via [AGWA/git-crypt](https://github.com/AGWA/git-crypt). The [gitattributes](.gitattributes) file controls which which files are encrypted. Use `git-crypt status -e` to see all encrypted files in the repository.

## Authors

- _Andreas Sagen_ - Maintainer

This project does not currently accept commits from non-authors. Feel free to fork and make it your own, or use configuration files and/or ideas from this project, freely.

## License

This project is licensed under `Unlicense`. For more details see [LICENSE](LICENSE).

## Acknowledgments

- [jimbrig/jimsdots](https://github.com/jimbrig/jimsdots) for the inspiration to this project.
- [AGWA/git-crypt](https://github.com/AGWA/git-crypt) for allowing me to keep secrets secret.
