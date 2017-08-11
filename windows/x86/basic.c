#include <stdio.h>
#include "windows.h"

void shell_code() {
    // Call virtualprotect to see what shellcode looks like
    DWORD old_protect;
    PDWORD prev_access = (PDWORD)&old_protect;
    int res;
    LPVOID paddr = (LPVOID)0x00446000;
    res = VirtualProtect(paddr, 1000, PAGE_EXECUTE_READWRITE, prev_access);
}

void __declspec(naked) END_SHELLCODE(void) {}

int main(int argc, char *argv[]) {
	int scsize = (int)END_SHELLCODE - (int)shell_code;

	printf("Shellcode is %d bytes long. Starting shellcode...\n", scsize);

	shell_code();
}
