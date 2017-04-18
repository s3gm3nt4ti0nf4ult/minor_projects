[bits 32]
; cdcel convention

push 'H'
call [ebx+4]  ;putchar
add esp, 4      ;adding to stack = removing from stack 'H' that was pushed before

push 0
call [ebx]  ;calling exit 
