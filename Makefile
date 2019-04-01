led: led.o
	ld led.o -o led

led.o:
	as led.s -o led.o

run:
	sudo sh -c 'echo none > /sys/class/leds/led0/trigger'
	sudo ./led

clean:
	rm -rf led.o led
