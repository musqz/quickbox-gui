#!/bin/bash

# Quickbox GUI Installation Script
# MIT License - Copyright (c) 2026 Musqz

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Quickbox GUI Installer ===${NC}\n"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: This script must be run as root${NC}"
   echo "Try: sudo ./install.sh"
   exit 1
fi

# Check required files exist
echo "Checking files..."
for file in quickbox-gui quickbox-gui.desktop LICENSE; do
    if [[ ! -f "$file" ]]; then
        echo -e "${RED}Error: $file not found${NC}"
        exit 1
    fi
done

# Install main application
echo "Installing quickbox-gui to /usr/local/bin/"
cp quickbox-gui /usr/local/bin/
chmod +x /usr/local/bin/quickbox-gui
echo -e "${GREEN}✓ quickbox-gui installed${NC}"

# Install desktop file
echo "Installing desktop file to /usr/share/applications/"
cp quickbox-gui.desktop /usr/share/applications/
echo -e "${GREEN}✓ quickbox-gui.desktop installed${NC}"

# Install optional launcher if available
if [[ -f "quickbox-launch" ]]; then
    echo "Installing quickbox-launch to /usr/local/bin/ (Alt-F2 support)"
    cp quickbox-launch /usr/local/bin/
    chmod +x /usr/local/bin/quickbox-launch
    echo -e "${GREEN}✓ quickbox-launch installed${NC}"
else
    echo -e "${YELLOW}Warning: quickbox-launch not found (optional)${NC}"
fi

# Create config directory
echo "Creating config directory..."
mkdir -p /root/.config/quickbox
echo -e "${GREEN}✓ Config directory created${NC}"

echo ""
echo -e "${GREEN}=== Installation Complete ===${NC}"
echo ""
echo "Usage:"
echo "  Command line: quickbox-gui"
echo ""
echo "To uninstall: sudo ./uninstall.sh"
