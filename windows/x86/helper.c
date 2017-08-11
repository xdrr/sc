#include "windows.h"
#include "stdlib.h"
#include "stdio.h"

int main() {
    printf("Some useful information about the windows API...\n");
    printf("PROCESS_INFORMATION is %d bytes big\n", sizeof(PROCESS_INFORMATION));
    printf("STARTUPINFO is %d bytes big\n", sizeof(STARTUPINFO));

    return 0;
}
