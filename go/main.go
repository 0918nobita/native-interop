package main

// #cgo LDFLAGS: -L../shared_library -lmylib
// #include "../shared_library/mylib.h"
import "C"

func main() {
    C.my_func()
}
