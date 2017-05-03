[bits 32]

call func ; call func

push 0 ; push 0 to stack && exit
call [ebx]

func:
  call asdf_p ; calling it pushes addr of string on stack
  db "I'm an function func()", 0xa, 0
  asdf_p:
  call [ebx+4*3]; printf call
  add esp, 4 ; remove from stack
  ret ; return 



  ; cdecl - caller cleans stack (ex. printf)
  ; stdcall - callee cleans stack 
  ; 
