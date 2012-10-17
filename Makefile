CC=gcc

.PHONY: all
all: dlopen_test


.PHONY: run
run:
	./a.out

.PHONY: shared
shared:
	$(CC) -o lib.so -shared -fPIC lib.c

.PHONY: dlopen_test
dlopen_test: shared
	$(CC) -o a.out dlopen_test.c -ldl

.PHONY: simple
simple:
	$(CC) -c lib.c -fPIC
	$(CC) -o a.out simple.c lib.o
	ldd a.out

.PHONY: clean
clean:
	rm -f *.out *.o *.so
