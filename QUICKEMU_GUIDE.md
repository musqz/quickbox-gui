# Quickemu Manual Guide

Simple command reference for quickemu and quickget.

## Installation

```bash
sudo pacman -S quickemu  (Arch/Manjaro)
sudo apt install quickemu  (Debian/Ubuntu)
sudo dnf install quickemu  (Fedora)
```

## Quickget - Download Distros

List available distros:

```bash
quickget --list
```

Download a distro (creates ISO + disk):

```bash
quickget ubuntu 24.04
quickget fedora 41
quickget debian 12
quickget arch latest
quickget almalinux 9
```

This creates a directory with distro name containing ISO and ready-to-use disk image.

## Quickemu - Run VMs

Basic VM launch:

```bash
quickemu --vm ubuntu-24.04
```

With custom resources (memory in MB, cores):

```bash
quickemu --vm ubuntu-24.04 --memory 4096 --cores 4
```

With custom display (2 monitors, fullscreen, etc):

```bash
quickemu --vm ubuntu-24.04 --display spice --width 1920 --height 1080
```

Enable USB redirection:

```bash
quickemu --vm ubuntu-24.04 --usb-device 1234:5678
```

Network modes:

```bash
quickemu --vm ubuntu-24.04 --network user
quickemu --vm ubuntu-24.04 --network tap
quickemu --vm ubuntu-24.04 --network none
```

Headless mode (no GUI):

```bash
quickemu --vm ubuntu-24.04 --nographic
```

Start VM in background:

```bash
quickemu --vm ubuntu-24.04 &
```

## VM Directory Structure

After quickget download:

    ubuntu-24.04/
    ├── ubuntu-24.04.conf       (VM config file)
    ├── ubuntu-24.04.iso        (Installation media)
    └── ubuntu-24.04.qcow2      (Disk image - created on first boot)

## Configuration

Edit VM settings:

    nano ubuntu-24.04/ubuntu-24.04.conf

Key options in .conf file:

    boot="efi"                  (UEFI boot)
    boot="legacy"               (BIOS boot)
    cpu_cores="4"
    ram="4096"
    disk_size="50"              (GB)

## Common Tasks

First boot (ISO install):

```bash
quickemu --vm ubuntu-24.04
```

After install (disk only):

```bash
quickemu --vm ubuntu-24.04
```

Monitor VM:

```bash
qemu-system-x86_64 -monitor stdio ...
```

List running VMs:

```bash
ps aux | grep quickemu
```

Stop VM:

```bash
# In VM: shutdown -h now
# Or press Ctrl-C in terminal
```

Delete VM (warning - data loss):

```bash
rm -rf ubuntu-24.04/
```

Resize disk (offline):

```bash
qemu-img resize ubuntu-24.04/ubuntu-24.04.qcow2 +20G
```

Create snapshot:

```bash
qemu-img snapshot -c snap1 ubuntu-24.04/ubuntu-24.04.qcow2
```

List snapshots:

```bash
qemu-img snapshot -l ubuntu-24.04/ubuntu-24.04.qcow2
```

## SSH into VM

Find VM IP:

```bash
ip addr show  # inside VM
```

SSH access (from host):

```bash
ssh user@vm_ip_address
```

Setup SSH in VM (Ubuntu/Debian):

```bash
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
```

## File Sharing

SPICE file drop (easiest):

```bash
# Download SPICE client
# Drag and drop files into SPICE window
```

Shared folder (using 9p):

```bash
# Edit .conf: virtfs="/home/user/shared,mount_tag=host"
# Mount in VM: sudo mount -t 9p -o trans=virtio host /mnt/shared
```

## Useful Links

Quickemu: https://github.com/quickemu-project/quickemu
Quickget: Part of quickemu package
QEMU docs: https://www.qemu.org/documentation/

## Tips

- Keep distro downloads organized in one directory
- Backup .conf files before major changes
- Use snapshots before major system updates
- Monitor disk space - qcow2 can grow large
- Use headless mode for server installs
