#!/bin/sh
set -e

#
# Pelican quick install script
#
# View source: https://github.com/PelicanPlatform/get-pelican/blob/main/get_pelican.sh
# Issues? Create a ticket: https://github.com/PelicanPlatform/get-pelican/issues
#
#
# This script is meant for quick & easy install via:
#
#   $ sudo curl -fsSL https://pelicanplatform.org/get-pelican/ | /bin/sh -s -- --no-dry-run
#


# Function to detect OS
detect_os() {
  if [ "$(uname -o)" = "Linux" ] || [ "$(uname -o)" = "GNU/Linux" ]; then
    if [ -f /etc/redhat-release ]; then
      echo "RHEL"
    elif [ -f /etc/debian_version ]; then
      echo "Debian"
    elif [ -f /etc/alpine-release ]; then
      echo "Alpine"
    else
      echo "Unsupported OS"
    fi
  elif [ "$(uname -o)" = "Darwin" ]; then
    echo "MacOS"
  elif [ "$(uname -o)" = "Cygwin" ] || [ "$(uname -o)" = "Msys" ] || [ "$(uname -o)" = "Windows" ]; then
    echo "Windows is unsupported at this time"
    echo "Please open an issue if you would like to see support for Windows"
    echo "https://github.com/PelicanPlatform/get-pelican/issues"
    exit 1
  else
    echo "Unsupported OS"
  fi
}

# Function to detect architecture
detect_arch() {
  arch=$(uname -m)
  case "$arch" in
    x86_64 | amd64)
      echo "amd64"
      ;;
    arm64 | aarch64)
      echo "arm64"
      ;;
    ppc64le)
      echo "ppc64le"
      ;;
    ppc64el)
      echo "ppc64el"
      ;;
    *)
      echo "Unsupported architecture"
      ;;
  esac
}

# Dry run
os=$(detect_os)
arch=$(detect_arch)

echo "Detected OS: $os"
echo "Detected Architecture: $arch"

# Check compatibility and install Pelican client
if [ "$os" = "Unsupported OS" ] || [ "$arch" = "Unsupported architecture" ]; then
  echo "Incompatible OS or architecture. Exiting."
  exit 1
fi

# Installation logic (example)
if [ "$os" = "RHEL" ]; then

  echo "Installing Pelican client for RHEL on $arch..."

  # Check PowerPC architecture
  if [ "$arch" = "ppc64el" ]; then
    echo "Unsupported architecture (${arch}) for RHEL. Exiting."
    exit 1
  fi

  # Change arm64 to aarch64 for RHEL
  if [ "$arch" = "arm64" ]; then
    arch="aarch64"
  fi

  yum install -y https://dl.pelicanplatform.org/latest/pelican.${arch}.rpm

elif [ "$os" = "Debian" ]; then

  echo "Installing Pelican client for Debian on $arch..."

  # Check PowerPC architecture
  if [ "$arch" = "ppc64el" ]; then
    echo "Unsupported architecture (${arch}) for Debian. Exiting."
    exit 1
  fi

  # Change aarch64 to arm64 for Debian
  if [ "$arch" = "aarch64" ]; then
    arch="arm64"
  fi

  wget https://dl.pelicanplatform.org/latest/pelican_${arch}.deb
  dpkg -i pelican_${arch}.deb

elif [ "$os" = "Alpine" ]; then
  echo "Installing Pelican client for Alpine on $arch..."

  # Check PowerPC architecture
  if [ "$arch" = "ppc64el" ]; then
    echo "Unsupported architecture (${arch}) for Alpine. Exiting."
    exit 1
  fi

  # Change arm64 to aarch64 for RHEL
  if [ "$arch" = "arm64" ]; then
    arch="aarch64"
  fi

  # Change amd64 to x86_64 for Alpine
  if [ "$arch" = "amd64" ]; then
    arch="x86_64"
  fi

  wget https://dl.pelicanplatform.org/latest/pelican_${arch}.apk
  apk add --allow-untrusted pelican_${arch}.apk

elif [ "$os" = "MacOS" ]; then
  echo "Installing Pelican client for MacOS on $arch..."

  # Verify the arch is arm64 or x86_64
  if [ "$arch" != "arm64" ] && [ "$arch" != "x86_64" ]; then
    echo "Unsupported architecture (${arch}) for MacOS. Exiting."
    exit 1
  fi

  curl -LO https://dl.pelicanplatform.org/latest/pelican_Darwin_${arch}.tar.gz

  # The untarred file will include the version number, lets rename it to pelican
  mkdir pelican
  tar -xvf pelican_Darwin_${arch}.tar.gz -C pelican --strip-components=1

  mv pelican/pelican /usr/local/bin/pelican
  rm -rf pelican pelican_Darwin_${arch}.tar.gz

else
  echo "Unsupported OS or architecture. Exiting."
  exit 1
fi