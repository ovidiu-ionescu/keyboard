# Unicomp PC122

The Unicomp PC122 keyboard does not work with usbhid driver that comes by
default with Debian.  
One solution is to compile the stock driver for the kernel and use that one
instead. The one present here is based on
_linux-source-4.19/drivers/hid/usbhid/usbkbd.c_

## Manual build
The kernel has to be told to use the custom driver for this particular 
keyboard. The solution was to use a udev rules that triggers  when the keyboard 
is plugged into the usb port. The rule will unbind the keyboard from the 
_usbhid_ driver, will load the module containing the custom driver and will bind
the keyboard to it.

### Build and install
```bash
make
sudo make install
```

The second command will copy the module binary to _/usr/local/bin_ and the udev
rule to _/etc/udev/rules.d_ .


## Using dkms
Create a tar file with the source, add it to the kernel and build:
```bash
# make a tar file that dkms can load. You can also use mktar.sh
$ tar czvf usbpc121.tar.gz dkms_source_tree

# load the source into /usr/src
$ sudo dkms ldtarball ./usb120.tar.gz

# create usbpc121.ko 
$ sudo dkms build usbpc121/1.0.0

# install it in the kernel
$ sudo dkms install usbpc121/1.0.0

# load it. At startup it will autoload
$ sudo modprobe usbpc121
```
