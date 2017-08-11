#include "windows.h"
#include "winternl.h"
#include "stdio.h"

PPEB get_peb() {
    asm (
            ".intel_syntax;"
            "mov eax, fs:[0x30];"
            "ret;"
        );
}

DWORD hash_module(UNICODE_STRING name) {
    DWORD iv = 0xDEADC0DE;
    DWORD result = iv;
    PWSTR buf = name.Buffer;
    for (int i = 0; i < 66; i++) {
        for (int j = 0; j < name.Length-1; j++)
            result = result << buf[j];
    }
    return result;
}

HMODULE find_module(DWORD hash) {
    PPEB peb;
    PLIST_ENTRY curEntry;
    PLIST_ENTRY firstEntry;
    PLDR_DATA_TABLE_ENTRY entry;

    peb = get_peb();
    printf("Got the PEB\n");
    firstEntry = (PLIST_ENTRY)peb->Ldr->InMemoryOrderModuleList.Flink;
    curEntry = (PLIST_ENTRY)firstEntry->Blink;

    while (firstEntry->Flink != curEntry->Flink) {
        entry = (PLDR_DATA_TABLE_ENTRY)curEntry->Flink;
        if (hash_module(entry->FullDllName) == hash) {
            return (HMODULE)entry->DllBase;
        }
        curEntry = curEntry->Blink;
    }
}

void sc() {
    char cmd[] = { "C:\\windows\\system32\\calc.exe" };
    HMODULE kern32;

    kern32 = find_module(0xAAAABBBB);

    return;
}

int main() {
    sc();
    return 0;
}
