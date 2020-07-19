package main

// #cgo LDFLAGS: -L../build/dylib -lmylib
// #include "../dylib/mylib.h"
import "C"

func main() {
	C.my_func()
}
