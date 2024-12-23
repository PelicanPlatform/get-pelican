#!/bin/bash

# Function to detect OS
detect_os() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/redhat-release ]; then
      echo "RHEL"
    elif [ -f /etc/debian_version ]; then
      echo "Debian"
    elif [ -f /etc/alpine-release ]; then
      echo "Alpine"
    else
      echo "Unsupported OS"
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MacOS"
  elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    echo "Windows"
  else
    echo "Unsupported OS"
  fi
}

# Function to detect architecture
detect_arch() {
  arch=$(uname -m)
  case "$arch" in
    x86_64)
      echo "amd64"
      ;;
    aarch64)
      echo "arm64"
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
if [[ "$os" == "Unsupported OS" || "$arch" == "Unsupported architecture" ]]; then
  echo "Incompatible OS or architecture. Exiting."
  exit 1
fi

# Installation logic (example)
if [[ "$os" == "RHEL" || "$os" == "Debian" || "$os" == "Alpine" ]]; then
  echo "Installing Pelican client for $os on $arch..."
  # Add installation commands here
elif [[ "$os" == "MacOS" ]]; then
  echo "Installing Pelican client for MacOS on $arch..."
  # Add installation commands here
elif [[ "$os" == "Windows" ]]; then
  echo "Installing Pelican client for Windows on $arch..."
  # Add installation commands here
else
  echo "Unsupported OS or architecture. Exiting."
  exit 1
fi
