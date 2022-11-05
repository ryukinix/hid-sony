obj-m += hid-sony.o

all: compile
	sudo rmmod hid_sony
	sudo rm -f /lib/modules/$(shell uname -r)/kernel/drivers/hid/hid-sony.ko

	sudo cp ./hid-sony.ko /lib/modules/$(shell uname -r)/kernel/drivers/hid/
	sudo insmod /lib/modules/$(shell uname -r)/kernel/drivers/hid/hid-sony.ko

	make clean

compile:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
