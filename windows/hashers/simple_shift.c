#include "windows.h"
#include "stdlib.h"

/*

	A simple shift hasher for uniquely idenifying
	modules when exploring the PEB.

	Author: Ben Nott <pajexali@gmail.com>
	Date: August 2017

*/ 
DWORD do_hash(char name[]) {
     DWORD iv = 0xDEADC0DE;
     DWORD result = iv;
     if (name[0] == 0x00) {
         return iv;
     }
     for (int i = 0; i < 10; i++) {
         if (name[i] == 0x00)
             break;
          result = result + ((DWORD)name[i] << i);
     }
     return result;
 }

DWORD unicode_do_hash(PWSTR name, DWORD len) {
     DWORD iv = 0xDEADC0DE;
     DWORD result = iv;
     if (len == 0) {
         return iv;
     }
     for (int i = 0; i < 10; i++) {
         if (name[i] == 0x00)
             break;
          result = result + ((DWORD)name[i] << i);
     }
     return result;
 }
