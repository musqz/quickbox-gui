# Quickbox GUI

GTK3-based GUI for managing QEMU virtual machines with quickemu integration.

## Features

VM creation, deletion, start/stop, SSH port management, snapshots, migration, cloning, ISO management, 

boot order control, UEFI/BIOS support, distro updates. 

Quickget to get the latest updated distro's. In GUI a refresh button.

## Disclaimer

I think when it is tested for longer I would say it is stable. 

Note: The SSH part is mostly a helping hand with some oneliners and setting up the sshd (daemon).

## Requirements

- Python 3.6+
- GTK3 (python3-gi, gobject-introspection)
- quickemu (quickget inside)

## Installation

Easiest method using install script:

```
    sudo ./install.sh
```

Manual installation as root:

```
    sudo cp quickbox-gui /usr/local/bin/
    sudo chmod +x /usr/local/bin/quickbox-gui
    sudo cp quickbox-gui.desktop /usr/share/applications/
```

Optional - Alt-F2 launcher support:

```
    sudo cp quickbox-launch /usr/local/bin/
    sudo chmod +x /usr/local/bin/quickbox-launch
```

## Uninstallation

```
    sudo ./uninstall.sh
```

Or manually remove:


```
    sudo rm /usr/local/bin/quickbox-gui
    sudo rm /usr/local/bin/quickbox-launch (if installed)
    sudo rm /usr/share/applications/quickbox-gui.desktop
```

## Usage

Command line:

```
    quickbox-gui
```

## Configuration

Config stored in ~/.config/quickbox/quickbox-gui.conf
Default VM directory: ~/emu/

## Files

- quickbox-gui: Main Python application
- quickbox-launch: Bash wrapper enables Alt-F2 launcher support (runs python3 quickbox-gui)
- quickbox-gui.desktop: Desktop integration
- install.sh: Installation script
- uninstall.sh: Uninstallation script
- LICENSE: MIT License

## License

MIT - Copyright (c) 2026 Musqz
