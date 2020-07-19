import ctypes

mylib = ctypes.CDLL("./dylib/libmylib.so")
mylib.my_func.argtypes = tuple()
mylib.my_func.restype = ctypes.c_int
print(mylib.my_func())
