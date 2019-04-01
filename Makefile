all: test.o
	@ld test.o -o test

test.o: test.s
	@as test.s -o test.o

test.s: led.s
	@python -c 'print(open("template.s").read().format(user_code=open("led.s").read().replace(".section .init","").replace(".global _start","").replace("_start:","")))' > test.s

run: all
	@sudo sh -c 'echo none > /sys/class/leds/led0/trigger'
	@sudo sh -c 'echo none > /sys/class/leds/led1/trigger'
	sudo ./test

debug: all
	sudo gdb ./test


clean:
	rm -rf test.s test.o test
