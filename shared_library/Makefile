main: libmylib.so
	$(CC) -o main main.c ./libmylib.so

libmylib.so:
	$(CC) -shared -o libmylib.so mylib.c

.PHONY: clean
clean:
	rm -rf main libmylib.so
