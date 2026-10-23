# Unicomp PC122

The Unicomp PC122 keyboard does not work with usbhid driver that comes by
default with Debian.  
One solution is to compile the stock driver for the kernel and use that one
instead. The one present here is based on
_linux-source-4.19/drivers/hid/usbhid/usbkbd.c_

There are two methods to install the driver:
- [Using DKMS](DKMS/README.md) (prefered method)
- [Manual build](Driver/README.md)


