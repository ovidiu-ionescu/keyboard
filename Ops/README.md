To view traffic on the USB bus you need to load a special module
[doc usbmon](https://www.kernel.org/doc/Documentation/usb/usbmon.txt)
```bash
sudo modprobe usbmon
```
You can see the USB devices with _lsusb_ or in detail with:
```bash
sudo cat /sys/kernel/debug/usb/devices
```
Monitor usb traffic:
```bash
sudo cat /sys/kernel/debug/usb/usbmon/1u > 2.mon.out
```
You can also start wireshark and monitor the traffic, it sometimes gives better
explanations about the error fields.

This way you determine where a device is listening:
```bash
cat /proc/bus/input/devices
```
The one in question will have Handlers e.g. event15 so it will be at
_/dev/input/event15_.

hid descriptor:
```bash
sudo cat /sys/kernel/debug/hid/0003:17F6:0879.0009/rdesc
```

USB drivers:
```bash
ls /sys/bus/usb/drivers
```

Fiecare driver are un link cu device-urile cu care discută
Every driver has a link to the devices it talks to:
```bash
ls /sys/bus/usb/drivers/usbhid
```

USB Devices:
```bash
ls /sys/bus/usb/devices
```

Looking for a vendor and product to identify a device:
```bash
find /sys -name product
```

PC122 also has in its directory 0003:17F6:0879.0009

Monitoring udev events, including the properties:
```bash
sudo udevadm monitor -p
```
