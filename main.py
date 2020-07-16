import ctypes

mylib = ctypes.CDLL("./shared_library/libmylib.so")
mylib.my_func.argtypes = tuple()
mylib.my_func.restype = ctypes.c_int
print(mylib.my_func())
