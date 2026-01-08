# Install using DKMS (prefered method)

Using just:

```bash
just install
```

The usbhid driver is greedy and it could take over the keyboard even if the vendoId:productId
are specified in the usbpc121 driver.
To make usbhid ignore those keyboards run:

```bash
just hid
```
This will copy a file to `/etc/modprobe.d/` instructing it to skip those ids.
You can check if it worked with:
```bash
lsusb -t
```

The just install recipe copies the files straight to /usr/src/usbpc121-1.0.0\
There is another way to copy the source: make a tarball and use `dkms ldtarball`
but that involves more steps.

### Boot password
If the drive is encrypted, the usbpc121 driver needs to be included in the image used
at boot. Add `usbpc121` to `/etc/initramfs-tools/modules` and regenerate initramfs:

```bash
sudo update-initramfs -u
```
Also make sure `/etc/initramfs-tools/initramfs.conf` contains the line: `MODULES=most`

To look inside the image do:
```bash
lsinitramfs /boot/initrd.img(uname -r) | grep usbpc121
lsinitramfs /boot/initrd.img(uname -r) | grep usbpc-keyboards.conf
```

### Adding support for other keyboards
Some vendoId/productId combinations have been added inside the driver so 
that it recognizes the keyboard without using udev rules.

For other combinations, either add them to the `usb_kbd_id_table` 
in `usbpc121.c` or use udev rules.

