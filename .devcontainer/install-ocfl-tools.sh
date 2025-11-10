#!/bin/bash
set -e

# OCFL Tools installation script
# Detects system architecture and installs the appropriate version

VERSION="${1:-0.3.2}"
REPO="srerickson/ocfl-tools"
INSTALL_DIR="/usr/local/bin"

echo "Installing ocfl-tools version ${VERSION}..."

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64)
    ASSET_NAME="ocfl-tools_Linux_x86_64.tar.gz"
    ;;
  aarch64|arm64)
    ASSET_NAME="ocfl-tools_Linux_arm64.tar.gz"
    ;;
  *)
    echo "Error: Unsupported architecture: $ARCH"
    echo "Supported architectures: x86_64, arm64"
    exit 1
    ;;
esac

echo "Detected architecture: $ARCH"
echo "Downloading asset: $ASSET_NAME"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Download the release
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ASSET_NAME}"
echo "Downloading from: $DOWNLOAD_URL"
wget -q "$DOWNLOAD_URL" || {
  echo "Error: Failed to download $ASSET_NAME"
  rm -rf "$TMP_DIR"
  exit 1
}

# Extract the archive
echo "Extracting archive..."
tar -xzf "$ASSET_NAME"

# Find the ocfl binary (it should be in the extracted directory)
if [ -f "ocfl" ]; then
  echo "Installing ocfl to ${INSTALL_DIR}/ocfl"
  install -m 755 ocfl "${INSTALL_DIR}/ocfl"
else
  echo "Error: ocfl binary not found in archive"
  ls -la
  rm -rf "$TMP_DIR"
  exit 1
fi

# Cleanup
cd /
rm -rf "$TMP_DIR"

# Verify installation
if command -v ocfl >/dev/null 2>&1; then
  echo "Successfully installed ocfl-tools:"
  ocfl --version || ocfl --help | head -1
else
  echo "Error: ocfl command not found after installation"
  exit 1
fi
