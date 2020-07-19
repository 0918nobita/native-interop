#include<stdio.h>
#include "../dylib/mylib.h"

int main(void) {
    int status = my_func();
    printf("%i\n", status);
    return 0;
}
