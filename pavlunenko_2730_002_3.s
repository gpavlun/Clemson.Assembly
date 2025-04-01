/*
NAME    Gregory Pavlunenko
COURSE ECE 2730
SECTION 002
DATE 02.23.2025
FILE lab3.s
PURPOSE This program is designed to
take three side lengths and return
the type of triangle that would have
those sides
*/

/* begin assembly stub */

/*	FUNCTION:		classify
	ARGUMENTS:	three side lengths: i,j,k
	RETURNS:		the type of triangle: tri_type
	PURPOSE:		classifies triangles
*/

.globl classify
.type classify,@function
classify:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    /* my code */
    /* these three checks will see if any
    of the sides are 0, ie not a side*/
    movl i, %eax
    cmpl $0, %eax
    je ZeroCheck
    movl j, %eax
    cmpl $0, %eax
    je ZeroCheck    
    movl k, %eax
    cmpl $0, %eax
    je ZeroCheck
    back0:

    /* these three checks will see how many of
    the sides are equal to each other*/
    movl $0, match
    movl i, %eax
    cmpl j, %eax
    je match0
    back1:
    movl i, %eax
    cmpl k, %eax
    je match1
    back2:
    movl j, %eax
    cmpl k, %eax
    je match2
    back3:

    /* once it is determined that no sides
    equal 0, the following checks will
    determine the type of triangle */
    movl match, %eax
    cmpl $0, %eax
    jnz ifmatch

    movl i, %eax
    addl j, %eax
    movl k, %ebx
    cmpl %ebx, %eax
    jle iftriple
    movl j, %eax
    addl k, %eax
    movl i, %ebx
    cmpl %ebx, %eax
    jle iftriple    
    movl i, %eax
    addl k, %eax
    movl j, %ebx
    cmpl %ebx, %eax
    jle iftriple

    movl $3, tri_type
    jmp return

    /* I would say that this code overuses if
    statements and makes a pretty big mess in
    assembly when translated, but nevertheless
    I translated it as faithfully as I could
    from the C example given */
    iftriple:
    movl $0, tri_type
    jmp return

    ifmatch:
    movl match, %eax
    cmpl $1, %eax
    je ifmatch1
    movl match, %eax
    cmpl $2, %eax
    jne ifmatchn2
    movl i, %eax
    addl k, %eax
    movl j, %ebx
    cmpl %ebx, %eax
    jle ifiklj
    back4:
    movl $2, tri_type
    jmp return
    
    ifiklj:
    movl $0, tri_type
    jmp return

    ifmatch1:
    movl i, %eax
    addl j, %eax
    movl k, %ebx
    cmpl %ebx, %eax
    jle ifijlk
    jmp back4
    
    ifmatchn2:
    movl match, %eax
    cmpl $6, %eax
    je ifmatch6
    movl j, %eax
    addl k, %eax
    movl i, %ebx
    cmpl %ebx, %eax
    jle ifjkli
    jmp back4

    ifjkli:
    movl $0, tri_type
    jmp return

    ifmatch6:
    movl $1, tri_type
    jmp return

    ifijlk:
    movl $0, tri_type
    jmp return

    match0:
    addl $1, match
    jmp back1
    match1:
    addl $2, match
    jmp back2
    match2:
    addl $3, match
    jmp back3

    ZeroCheck:
    movl $0, tri_type
    jmp back0


    return:
    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

.comm i, 4
.comm j, 4
.comm k, 4
.comm tri_type, 4
.comm match, 4

/* end assembly stub */
