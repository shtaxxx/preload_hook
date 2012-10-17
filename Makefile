CC=gcc

.PHONY: all
all: dlopen_test

.PHONY: run
run:
	./a.out

.PHONE: preload
preload:
	$(CC) -o write_hook.so -shared -fPIC write_hook.c -ldl
	$(CC) -o a.out -fPIC -ldl write_hook_test.c

.PHONY: dlopen
dlopen: shared
	$(CC) -o a.out dlopen_test.c -ldl

.PHONY: shared
shared:
	$(CC) -o lib.so -shared -fPIC lib.c

.PHONY: simple
simple:
	$(CC) -c lib.c -fPIC
	$(CC) -o a.out simple.c lib.o
	ldd a.out

.PHONY: clean
clean:
	rm -f *.out *.o *.so
