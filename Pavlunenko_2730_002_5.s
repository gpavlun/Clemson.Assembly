/*
NAME:    Gregory Pavlunenko
COURSE:  ECE 2730
SECTION: 002
DATE:    03.23.2025
FILE:    Pavlunenko_2730_002_4.s
PURPOSE: This program is designed to
         take an integer input and
         calculate the fibonacci 
         sequence numbers up to that
         point.
*/

/*	
FUNCTION:     Fib
ARGUMENTS:    global_var
RETURNS:	     integer
PURPOSE:      recursive function that finds 
              the fibonacci sequence.
*/
.globl Fib
.type Fib,@function
Fib:
    /* prolog */
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp
    pushl %ebx
    pushl %esi
    pushl %edi

    /* put code here */
    movl $0, %ebx
    movl global_var, %ebx
    movl %ebx, -4(%ebp)
    cmpl $0, -4(%ebp)
    je return/*if it is a 0, return 0 */
    cmpl $1, -4(%ebp)
    je return/*if it is a 1, return 1 */


    movl $0, %ebx /*subtract one from the current value and store it globally */
    movl -4(%ebp), %ebx
    subl $1, %ebx
    movl %ebx, global_var
    
    call Fib /*calls self recursively */

    movl $0, %ebx 
    movl global_var, %ebx
    movl %ebx, -8(%ebp)/*takes the globally stored value and subtracts 2, then moves
    it to the original variable and the global variable, I am going to assume that
    I do not need to explain how a recursive function works, especially for something
    as simple as the fibonacci sequence.*/
    movl -4(%ebp), %ebx
    subl $2, %ebx
    movl %ebx, -4(%ebp)
    movl $0, %ebx
    movl -4(%ebp), %ebx
    movl %ebx, global_var
    
    call Fib /*calls self recursively */

    movl $0, %ebx
    movl -8(%ebp), %ebx
    addl global_var, %ebx
    movl %ebx, -8(%ebp)
    movl $0, %ebx
    movl -8(%ebp), %ebx
    movl %ebx, global_var 

    return:

    /* epilog */
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret
/* end assembly stub */
