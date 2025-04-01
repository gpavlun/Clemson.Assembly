/*
NAME:    Gregory Pavlunenko
COURSE:  ECE 2730
SECTION: 002
DATE:    02.23.2025
FILE:    Pavlunenko_2730_002_4.s
PURPOSE: This program is designed to
         take three side lengths and return
         the type of triangle that would have
         those sides
*/

/*	
FUNCTION:	Ascii to Integer (AtoI)
ARGUMENTS:	*ascii, *intptr
RETURNS:	output
PURPOSE:    converts ascii values to integer
            values.
*/

.globl AtoI
.type AtoI,@function
AtoI:
    /* prolog */
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi




    movl $1, sign

/* this section will read the address of ascii
and make a comparison to the space character. If
it is not, it will jump to ascnspc and check to
see if it is a tab. If it is a space, it moves the
the next value and jumps back*/
initcheck:
    movl ascii, %ebx    
    cmpb $32, (%ebx)   
    jne ascnspc             
    addl $1, ascii      
    jmp initcheck        
/* this section will check if there is a tab
and if it is not, will check for a plus or a
minus sign. If not, it will move to the next
character */
ascnspc:
    movl ascii, %ebx    
    cmpb $9, (%ebx)     
    jne ifplus        
    addl $1, ascii      
    jmp initcheck        

/* this section will perform a check to see if
the value of ascii is a plus or a minus sign. If
it is not, it will jump to ifminus and check to 
see if the value is a minus sign. if it wall a
plus sign, it will skip the minus check*/
ifplus:
    movl ascii, %ebx    
    cmpb $43, (%ebx)    
    jne ifminus       
    addl $1, ascii
    jmp cont      

ifminus:
    movl ascii, %ebx    
    cmpb $45, (%ebx)    
    jne Initintptr      
    movl $-1, sign      
    addl $1, ascii
    jmp cont

cont:      

/* this section will 0 out the
the int value and start
a for loop if the  with i at 0*/
Initintptr:
    movl intptr, %ecx   
    movl $0, (%ecx)     
    movl $0, i          


/* this section will move through the string
to the least significant digit, in decimal the 
ones place, and checks to see if it is in the 
range of 0 - 9. if it is in that range, it
will jump to the next value, otherwise it will
assume it has gone too far and subtract 1 from 
the current index to get a real number, which 
should only*/
endindex:
    movl i, %edi        
    movl ascii, %ebx    
    cmpb $48, (%ebx, %edi, 1)   
    jl subindex         
    cmpb $57, (%ebx, %edi, 1)   
    jg subindex         
    addl $1, i          
    jmp endindex       

subindex:
    addl $-1, ascii     
    movl $1, multiplier 

/* this is a bit hard to follow, but basically
it checks to see if the index is 0, if not, it
will take the ascii value at that index, subtract
48 to convert the ascii to an integer digit and
multiply by the place multiplier. then add the 
value to the return value. it will continue this
operation through the entire string.
 */
placeidnt:
    movl i, %edi        
    cmpl $0, i          
    jle signcheck        
    movl ascii, %ebx    
    movl $0, %eax       
    movb (%ebx, %edi, 1), %al   
    subb $48, %al       
    mull multiplier     
    movl $0, %edx       
    movl intptr, %edx   
    addl %eax, (%edx)   
    movl multiplier, %ecx   
    movl $10, %eax      
    mull %ecx           
    movl %eax, multiplier   
    addl $-1, i         
    jmp placeidnt            
/*this just assigns a sign to the value
given from the function return */
signcheck:
    movl sign, %eax     
    movl intptr, %ebx   
    mull (%ebx)         
    movl %eax, (%ebx)   



return:
    /* epilog */
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret

.comm output, 4
.comm ascii, 1
.comm intptr, 4
.comm sign, 4
.comm multiplier, 4
.comm i, 4

/* end assembly stub */
