main: libmylib.so
	cc -o main main.c ./libmylib.so

libmylib.so:
	cc -shared -o libmylib.so mylib.c

PHONY: clean
clean:
	rm -rf main libmylib.so
