#include "windows.h"
#include "winternl.h"
#include "winnt.h"
#include "stdio.h"

extern PPEB get_peb(void);

asm(
        ".intel_syntax;"
        "_get_peb:\n\t"
        "mov eax, fs:[0x30];\n\t"
        "ret;\n"
   );

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

HMODULE find_module(DWORD hash) {
    PPEB peb;
    PLIST_ENTRY curEntry;
    PLIST_ENTRY firstEntry;
    PLDR_DATA_TABLE_ENTRY entry;

    peb = get_peb();
    firstEntry = (PLIST_ENTRY)peb->Ldr->InMemoryOrderModuleList.Flink;
    curEntry = (PLIST_ENTRY)firstEntry->Blink;

    while (firstEntry->Flink != curEntry->Flink) {
        entry = (PLDR_DATA_TABLE_ENTRY)curEntry->Flink;
        if (unicode_do_hash((PWSTR)entry->FullDllName.Buffer, (DWORD)entry->FullDllName.Length) == hash) {
            // This is pretty BS
            // Thanks WinD0s
            return (HMODULE)entry->Reserved2[0];
        }
        curEntry = curEntry->Blink;
    }
    return NULL;
}

FARPROC find_function(HMODULE module, DWORD hash) {
    IMAGE_DOS_HEADER *dos_header;
    IMAGE_NT_HEADERS *nt_headers;
    IMAGE_EXPORT_DIRECTORY *export_dir;
    DWORD *names, *funcs;
    WORD *nameords;

    dos_header = (IMAGE_DOS_HEADER *)module;
    nt_headers = (IMAGE_NT_HEADERS *)((char *)module + dos_header->e_lfanew);
    export_dir = (IMAGE_EXPORT_DIRECTORY *)((char *)module + nt_headers->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    names = (PDWORD)((char *)module + export_dir->AddressOfNames);
    funcs = (PDWORD)((char *)module + export_dir->AddressOfFunctions);
    nameords = (PWORD)((char *)module + export_dir->AddressOfNameOrdinals);

    for (int i = 0; i < export_dir->NumberOfNames; i++) {
        char *name = (char *)module + names[i];
        if (hash == do_hash(name)) {
            WORD nameord = nameords[i];
            DWORD funcrva = funcs[nameord];
            return (FARPROC)((char *)module + funcrva);
        }
    }
    return NULL;
}

void sc() {
    char cmd[] = { "C:\\windows\\system32\\calc.exe" };
    HMODULE kern32;
    HMODULE msvcrt;
    FARPROC createProcessA;
    FARPROC memset;

    STARTUPINFO procStart;
    PROCESS_INFORMATION procInfo;

    // Now we can locate modules with position independence
    kern32 = find_module(0xdeaeaefb);
    msvcrt = find_module(0xdeaf5e41);
    createProcessA = find_function(kern32, 0xdeaf5c81);
    memset = find_function(msvcrt, 0xdeaddc31);

    // Let's setup the call
    memset(&procStart, 0x00, sizeof(procStart));
    memset(&procInfo, 0x00, sizeof(procInfo));
    procStart.cb = sizeof(procStart);

    createProcessA(
            cmd,
            NULL,
            NULL,
            NULL,
            FALSE,
            0,
            NULL,
            NULL,
            &procStart,
            &procInfo);

    return;
}

int main() {
    sc();
    return 0;
}
