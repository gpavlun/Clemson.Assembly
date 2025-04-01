/*
NAME Gregory Pavlunenko
COURSE ECE 2730
SECTION 002
DATE 01.27.25
FILE lab2.s
PURPOSE This code performs various
operations with 3 variables
*/

/*
FUNCTION doiff()
ARGUMENTS void

RETURNS diff
PURPOSE takes the sum of digit1 squared 
and digit2 squared, subtracting digit3 squared
*/
.globl dodiff
.type dodiff, @function
dodiff :
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /*move variable to register A, 
    multiply by self then move to 
    different register */
    movl digit1, %eax
    mull digit1
    movl %eax, %ebx

    movl digit2, %eax
    mull digit2
    movl %eax, %ecx

    movl digit3, %eax
    mull digit3
    movl %eax, %edx

    /*add each register together 
    and store in diff */
    addl %ecx, %ebx
    subl %edx, %ebx
    movl %ebx, diff

    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/*
FUNCTION dosumprod()
ARGUMENTS void

RETURNS sum, product
PURPOSE gets the sum and product of the digits
*/
.globl dosumprod
.type dosumprod, @function
dosumprod:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /* 
        sum = digit1 + digit2 + digit3
        product = digit1 * digit2 * digit3
    */
    /*moves each variable to a different 
    register and then summizes them, storing
    answer in sum */
    movl digit1, %ebx
    movl digit2, %ecx
    movl digit3, %edx
    addl %ecx, %ebx
    addl %edx, %ebx
    movl %ebx, sum
    /*stores digit1 in register A then multiplies 
    all of the other digits to it, storing the 
    answer in product */
    movl digit1, %eax
    mull digit2
    mull digit3
    movl %eax, product


    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/*
FUNCTION doremainder()
ARGUMENTS void

RETURNS remainder
PURPOSE gets the remainder of the product
divided by the sum
*/
.globl doremainder
.type doremainder, @function
    doremainder:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /* 
    remainder = product % sum
    */
    /*clear d register, move product to
    register A, divide by sum and 
    store remainder in remainder */
    movl $0, %edx
    movl product, %eax
    divl sum
    movl %edx, remainder


    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

.comm digit1, 4
.comm digit2, 4
.comm digit3, 4  
.comm diff, 4
.comm sum, 4
.comm product, 4
.comm remainder, 4

/* end assembly stub */
