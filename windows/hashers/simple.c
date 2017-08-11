#include "stdlib.h"
#include "stdio.h"

int hasher(char name[]) {
    int iv = 0xDEADC0DE;
    int result = iv;

    printf("Proceeding to hash %s\n", name);

    for (int i = 0; i < 10; i++) {
        result = result + ((int)name[i] << i);
    }
    return result;
}

int main() {
    int res;
    res = hasher("foo");
    printf("The result was 0x%08x\n", res);
    return 0;
}
