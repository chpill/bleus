# heko

This device will hold and Ubuntu and Nixos side by side, sharing their swap.


## Installation steps

Get yourself a recent nixos ISO and an usb key, and make it a liveUSB installer:
```
fdisk -l # get the location of the device, eg /dev/sdb
dd if=nixos-graphical-15.09.930.61a2952-x86_64-linux.iso of=/dev/sdb
```

Then boot it. If you don't have a network cable near you, you can connect via
wifi. The 15.09 release uses networkmanager by default, so you can use nmtui to
set up the wifi. To get a graphical session, type `start display-manager`
(:warning: The touchpad was not activated by default for my laptop, you better
know some KDE shortcuts, or get yourself an old school mouse!).

Partition the disk using [gdisk]:
  1. 50Mo Bios boot partition (`ef02`)
  2. 30Go for nixos (default as linux filesystem `8300`)
  3. 30Go for ubuntu (default)
  4. 18Go for swap (linux swap `8200`)
  5. all the rest for data (default)

[gdisk]: http://www.rodsbooks.com/gdisk/walkthrough.html

Create the filesystems for 2, 3 and 4
```
mkfs.ext4 -L nixos /dev/sda2
mkfs.ext4 -L ubuntu /dev/sda3
mkfs.ext4 -L data /dev/sda5
```

Create the swap `mkswap -L swap /dev/sda4`

Mount the target filesystem on which will be installed Nixos: `mount /dev/disk/by-label/nixos /mnt`.

Now generate yourself a hardware and default configuration:
`nixos-generate-config --root /mnt`. If you have a custom configuration file,
you can swap it with the default one. You could easily access it by sharing it
on pastebin or github. You can install curl with `nix-env -i curl`. Then
`curl pastebin/raw/xxx > configuration.nix`

Whatever you do, you may want to add a user to your configuration, with an
[initialPassword](https://nixos.org/nixos/manual/options.html#opt-users.users._name__.initialPassword)
(otherwise, you may get stuck at the login screen ><). You can then change the
password for your user as you would normally with `passwd`.
