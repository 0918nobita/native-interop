package main

// #cgo LDFLAGS: -L../dylib -lmylib
// #include "../dylib/mylib.h"
import "C"

func main() {
	C.my_func()
}
