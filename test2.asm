; hello (name)

  org $0100-2
  dw $0100

  namebuf: equ $0200

  ld r0,promptmsg
  call printstr

  ld r0,namebuf
  call readline

  ld r0,hellomsgp1
  call printstr
  ld r0,namebuf
  call printstr
  ld r0,hellomsgp2
  call printstr

  int 0

promptmsg:
  db "What is your name?\n>",0
hellomsgp1:
  db "Hello, ",0
hellomsgp2:
  db "!\n",0

printstr:
  ldb a,(r0)
  bz printstr0
  inc r0
  int 1
  b printstr
printstr0:
  ret

readline:
  ld r1,"\n"
readline0:
  int 2
  cmp r1
  bz readline1
  ldb (r0),a
  inc r0
  b readline0
readline1:
  ld a,0
  ldb (r0),a
  ret

