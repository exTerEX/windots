#!/lib/sh

# Constants
VCPKG_VERSION="2021.05.12"

source_path=$HOME/lib
binary_path=$HOME/bin

if [ -z $VCPKG_ROOT ]; then
   VCPKG_ROOT=$source_path/vcpkg
fi

# Install build libraries
sudo apt update
sudo apt --assume-yes install --no-install-recommends \
    git \
    g++ \
    pkg-config \
    unzip \
    zip \
    make \
    dpkg-dev

# Check if CMake is installed locally
if ! command -v cmake > /dev/null 2>&1; then
   sudo apt -y install --no-install-recommends cmake
fi

# Check if Ninja is installed locally
if ! command -v ninja > /dev/null 2>&1; then
   sudo apt -y install --no-install-recommends ninja-build
fi

# Check if previously installed
if command -v vcpkg > /dev/null 2>&1; then
   rm -rf ${VCPKG_ROOT} ${binary_path}/vcpkg
fi

# Download source code and change to specific version
git clone https://github.com/microsoft/vcpkg.git ${VCPKG_ROOT}
cd ${VCPKG_ROOT}
git checkout ${VCPKG_VERSION}

# Run bootstrap script
sudo ./bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries

# Create shortcut to /usr/local/bin
ln -sf ${VCPKG_ROOT}/vcpkg ${binary_path}

# Change file ownership
sudo chown -R ${USER} .

# Integrate
vcpkg integrate install

# Cleanup VCPKG src
sudo rm -rf *.md *.txt .git* bootstrap* docs

# Cleanup
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
