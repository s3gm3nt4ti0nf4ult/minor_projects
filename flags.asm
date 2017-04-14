[bits 32]
;code --> a==b?printf(a==b):a>b?printf(>):printf(<)

;stack alocation for variables

mov ebp, esp
sub esp,8 ; ESP ->[a] [b] [RET]
;                         ^
;                        EBP
; b -> EBP-4
; a -> EBP-8
;scanf, variables backwords
lea eax, [ebp-4]; eax = ebp-4
push eax
lea eax, [ebp-8]; eax = ebp-8
push eax
call do_scan
db"%i%i",0
do_scan:
call [ebx+4*4]; scanf
add esp,12 ; stack clear

mov eax, [ebp-8]
sub eax, [ebp-4]
push eax ; push solution on stack


jz equal_0 ; equal
js greater_b ; b greater, SF flag set


;SF not set:
push '>'
call [ebx+4]; putchar
jmp solution


equal_0:
push '='
call [ebx+4]; putchar
jmp solution

greater_b:
push '<'
call [ebx+4]; putchar

solution:
add esp,4

; ESP -> [solutin] [a] [b] [RET]

call print_solution
db 0xa, 'Solution: %i', 0xa, 0
print_solution:
call [ebx+3*4]
add esp, 8


push 0
call [ebx] ; exiting
