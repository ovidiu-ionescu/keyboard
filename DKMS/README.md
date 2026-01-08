# Install using DKMS (prefered method)

Using just:

```bash
just install
```

The just recipe copies the files straight to /usr/src/usbpc121-1.0.0\
There is another way to copy the source: make a tarball and use `dkms ldtarball`
but that involves more steps.

### Adding support for other keyboards
Some vendoId/productId combinations have been added inside the driver so 
that it recognizes the keyboard without using udev rules.

For other combinations, either add them to the `usb_kbd_id_table` 
in `usbpc121.c` or use udev rules.

