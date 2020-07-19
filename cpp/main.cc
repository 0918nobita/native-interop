#include<iostream>

extern "C" {
    #include "../dylib/mylib.h"
}

int main() {
    int status = my_func();
    std::cout << status << std::endl;
    return EXIT_SUCCESS;
}
