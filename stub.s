/*
NAME Gregory Pavlunenko
COURSE ECE 2730
SECTION 002
DATE 01.27.25
FILE stub.s
PURPOSE This code is designed to take
a string input and return the sum of
the ascii values
*/
/*
FUNCTION asum
ARGUMENTS buffer

RETURNS int
PURPOSE takes the ascii value of the
digits in the string array and sums
them together
*/

/* begin assembly code */

.globl asum
.type asum,@function
asum:
    pushl %ebp
    movl %esp, %ebp
    subl $4, %esp
    movl $0, -4(%ebp)
.L2:
    movl 8(%ebp),%eax
    cmpb $0,(%eax)
    jne .L4
    jmp .L3
.L4:
    movl 8(%ebp),%eax
    movsbl (%eax),%edx
    addl %edx, -4(%ebp)
    incl 8(%ebp)
    jmp .L2
.L3:
    movl -4(%ebp), %eax
    jmp .L1
.L1:
    movl %ebp, %esp
    popl %ebp
    ret

/* end assembly */
/* Do not forget the required blank line here! */