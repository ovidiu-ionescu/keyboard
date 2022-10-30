TARGET_MODULE	:=usbpc121

KERNELRELEASE	?= $(shell uname -r)
BUILDSYSTEM_DIR	?= /lib/modules/$(KERNELRELEASE)/build
PWD		:= $(shell pwd)
obj-m		:= $(TARGET_MODULE).o

PREFIX ?= /usr/local
BINDIR  = $(PREFIX)/bin
MANDIR  = $(PREFIX)/share/man
MAN1DIR = $(MANDIR)/man1
INSTALL = install
INSTALL_PROGRAM = $(INSTALL) -p -m 755
INSTALL_DIR     = $(INSTALL) -p -m 755 -d
INSTALL_DATA    = $(INSTALL) -m 644


.PHONY: all install clean
.PHONY: modprobe $(TARGET_MODULE)

.PHONY: $(TARGET_MODULE).ko

all: $(TARGET_MODULE).ko
$(TARGET_MODULE): $(TARGET_MODULE).ko
$(TARGET_MODULE).ko:
all:
	@echo "Building $(TARGET_MODULE) driver..."
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules

install:
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules_install
	@echo ""
	@echo "SUCCESS"
	@echo ""

clean:
	#rm -f *~
	#rm -f Module.symvers Module.markers modules.order
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) clean

modprobe: $(TARGET_MODULE).ko
	chmod a+r $(TARGET_MODULE).ko
	-sudo rmmod $(TARGET_MODULE)
	sudo insmod ./$(TARGET_MODULE).ko $(MODULE_OPTIONS)

udev:
	# the rule for the regular Unicomp keyboards
	cp 51-unicomp.rules /etc/udev/rules.d/
	# the rule for the 122 key Unicomp keyboards
	cp 52-unicomp.rules /etc/udev/rules.d/
	#sudo udevadm control --reload-rules

