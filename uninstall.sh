#!/bin/bash

# Quickbox GUI Uninstall Script
# MIT License - Copyright (c) 2026 Musqz

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Quickbox GUI Uninstaller ===${NC}\n"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: This script must be run as root${NC}"
   echo "Try: sudo ./uninstall.sh"
   exit 1
fi

# Confirm uninstall
echo -e "${RED}WARNING: This will remove Quickbox GUI${NC}"
echo "Configuration in ~/.config/quickbox/ will NOT be deleted"
echo ""
read -p "Continue with uninstall? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "Uninstalling..."

# Remove main application
if [[ -f /usr/local/bin/quickbox-gui ]]; then
    rm /usr/local/bin/quickbox-gui
    echo -e "${GREEN}✓ Removed /usr/local/bin/quickbox-gui${NC}"
fi

# Remove launcher
if [[ -f /usr/local/bin/quickbox-launch ]]; then
    rm /usr/local/bin/quickbox-launch
    echo -e "${GREEN}✓ Removed /usr/local/bin/quickbox-launch${NC}"
fi

# Remove desktop file
if [[ -f /usr/share/applications/quickbox-gui.desktop ]]; then
    rm /usr/share/applications/quickbox-gui.desktop
    echo -e "${GREEN}✓ Removed /usr/share/applications/quickbox-gui.desktop${NC}"
fi

echo ""
echo -e "${GREEN}=== Uninstall Complete ===${NC}"
echo ""
echo "Note: Configuration files in ~/.config/quickbox/ were NOT deleted"
echo "To completely remove: rm -rf ~/.config/quickbox/"
