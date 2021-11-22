#!/lib/sh

# Constants
FILE=Miniconda3-latest-Linux-x86_64.sh
URL=https://repo.anaconda.com/miniconda/${FILE}

# Download binary
if command -v wget > /dev/null 2>&1; then
  sudo wget ${URL} -O /tmp/miniconda.sh
fi

# Change file rights
sudo chmod +x /tmp/miniconda.sh

source_path=$HOME/lib
binary_path=$HOME/bin

# Ensure folder existance
if [ ! -d $source_path ]; then
  mkdir -p $source_path
fi

if [ -d $source_path/conda ]; then
  sudo rm -rf $source_path/conda
fi

# Install
sudo bash /tmp/miniconda.sh -b -p $source_path/conda
sudo ln -sf $source_path/conda/bin/conda $binary_path

# Access
sudo chown -R $(whoami):$(whoami) $source_path/conda
sudo chmod -R 777 $source_path/conda

# Cleanup
sudo rm -r /tmp/miniconda.sh
