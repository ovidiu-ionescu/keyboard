# Unicomp PC122

The Unicomp PC122 keyboard does not work with usbhid driver that comes by
default with Debian.  
One solution is to compile the stock driver for the kernel and use that one
instead. The one present here is based on
_linux-source-4.19/drivers/hid/usbhid/usbkbd.c_

The kernel has to be told to use the custom driver for this particular 
keyboard. The solution was to use a udev rules that triggers  when the keyboard 
is plugged into the usb port. The rule will unbind the keyboard from the 
_usbhid_ driver, will load the module containing the custom driver and will bind
the keyboard to it.





