#include<stdio.h>
#include "../shared_library/mylib.h"

int main(void) {
    int status = my_func();
    printf("%i\n", status);
    return 0;
}
