[bits 32]
; asmloader checking pariti bit (PE flag)
; test instruction

mov ebp, esp
sub esp, 4
; EBP -4 --> a

lea eax, [ebp-4]
push eax
call scanf_fmt
db '%i', 0
scanf_fmt:
call [ebx+4*4] ; scanf
add esp, 8

mov eax, [ebp-4]
test eax, eax

jp parity_set


call negative_parity
db 'Not even number of set bits', 0xa, 0
negative_parity:
jmp print ; watch out! not call

parity_set:
call print
db 'Even number of st bits', 0xa, 0

print:
call [ebx+4*3]
add esp, 4

push 0
call [ebx]

