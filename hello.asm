[bits 32]
; put char "A" == helloworld and other to put "xyz"

call [ebx+2*4] ; call getchar
;cdcel = getchat puts to eax

cmp eax, 'A'
jne other ; jump if not equal

call print_hello
db 'hello world!', 0xa, 0 ; put xyz on stack


print_hello:
call [ebx+3*4] ; printf
add esp, 4 ;clear stack
call [ebx] ;call exit


other:
call print_xyz
db 'xyz', 0xa, 0 ; put xyz on stack

print_xyz:
call [ebx+3*4]
add esp, 4
call [ebx]


