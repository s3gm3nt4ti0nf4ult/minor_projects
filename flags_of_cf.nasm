[bits 32]
;carry flag and overflow flag

mov ebp, esp
sub esp, 8 ; two arguments needed

lea eax, [ebp-4]
push eax
lea eax, [ebp-8]
push eax
call fmt_scanf
db '%i %i', 0 ; string format pushed on stack with call - trick
fmt_scanf:
call [ebx+4*4] ;call scanf
add esp, 12 ; clear stack

mov eax, [ebp-8] ; eax = a
add eax, [ebp-4] ; eax += b

jo print_overflow

call print_no
db 'There was no overflow!', 0xa, 0
print_no:
jmp print

print_overflow:
call print
db 'Oooops! There was an overflow!!!!!',0xa,0

print:
call [ebx+3*4]
add esp, 4


push 0
call [ebx]

