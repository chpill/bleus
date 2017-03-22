How to install nvidia proprietary driver on debian
==================================================

### download the driver from nvidia website

Don't forget to `chmod +x` the file.

### blacklist the nouveau driver

`sudo vim /etc/modprobe.d/blacklist-nouveau.conf` and add

```
    blacklist nouveau
    blacklist lbm-nouveau
    options nouveau modeset=0
    alias nouveau off
    alias lbm-nouveau off
```

### disable nouveau in the kernel

`echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf`

`sudo update-initramfs -u`

### reboot...

### stop the x server

For us, go to tty1, then `sudo service lightdm stop`.

### install (exec) the driver

### reboot

### if the graphics are not ok

`sudo nvidia-xconfig`
