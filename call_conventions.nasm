[bits 32]

call func ; call func

mov eax, 1337
call print_int_1
call print_int_2

push 0 ; push 0 to stack && exit
call [ebx]

func:
  call asdf_p ; calling it pushes addr of string on stack
  db "I'm an function func()", 0xa, 0
  asdf_p:
  call [ebx+4*3]; printf call
  add esp, 4 ; remove from stack
  ret ; return 

print_int_1: ; fastcall, args in eax
  push eax
  call print_int_1_p
  db "%i", 0xa, 0
  print_int_1_p:
  call [ebx+3*4]
  add esp, 8
  ret

print_int_2:


  ; cdecl - caller cleans stack (ex. printf)
  ; stdcall - callee cleans stack 
  ; fastcall - args placed in registers (if no free regs, stack) registers - depends on compiler
