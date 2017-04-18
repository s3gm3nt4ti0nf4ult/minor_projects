[bits 32]
;put data outside the code, relative addresses

call next ; putting addr of next on stack
next:
pop eax ; next addr in eax reg
; add eax, data-next
;{
;mov ebp, eax
;add ebp, data-next
;push ebp
;}
;push eax
;add dword [esp], data-next ;adding to sth on addr in esp offset

lea ebp, [eax+(data-next)] ; mov addr from right args to ebp
push ebp

call [ebx+3*4]  ;printf call (printf is using data from stack)
add esp, 4 ; stack clear

call [ebx]


data:
db "Hello world!",0xa,0

