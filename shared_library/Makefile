main: libmylib.so main.c mylib.h
	$(CC) -o main main.c ./libmylib.so

libmylib.so: mylib.c
	$(CC) -shared -o libmylib.so mylib.c

.PHONY: clean
clean:
	rm -rf main libmylib.so
