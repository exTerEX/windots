# Path to your oh-my-bash installation.
export OSH=$HOME/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="axin"

# Auto update every 30 days.
export UPDATE_OSH_DAYS=30

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $OSH/custom?
OSH_CUSTOM=$HOME/.custom

# Enabled completions
completions=(docker docker-compose git makefile pip ssh)

# Enabled aliases
aliases=(general)

# Enabled plugins
plugins=(git golang)

source $OSH/oh-my-bash.sh

# Disable auto update for oh-my-bash
DISABLE_AUTO_UPDATE="true"

# Command execution time stamp format
HIST_STAMPS="dd.mm.yyyy"

# SSH
export SSH_KEY_PATH="$HOME/.ssh/"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# vcpkg
export VCPKG_FEATURE_FLAGS=manifests,$VCPKG_FEATURE_FLAGS
export VCPKG_ROOT=$HOME/lib/vcpkg

# DISPLAY environment variable
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# Fixing a problem with git signing
export GPG_TTY=$(tty)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/exterex/lib/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/exterex/lib/conda/etc/profile.d/conda.sh" ]; then
        . "/home/exterex/lib/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/exterex/lib/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
