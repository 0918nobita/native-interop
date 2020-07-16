#include<iostream>

extern "C" {
    #include "../shared_library/mylib.h"
}

int main() {
    int status = my_func();
    std::cout << status << std::endl;
    return EXIT_SUCCESS;
}
