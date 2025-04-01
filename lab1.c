/* begin C driver */
#include <stdio.h>
int main(int arg, char **argv)
{
    char buffer[256];
    do {
        int i = 0;
        printf ("Enter a string terminated with a newline\n");
        do {
            buffer[i] = getchar();
        } while (buffer[i++] != '\n');
        buffer[i-1] = 0;
        /* asum() is the function implemented in assembly */
        i = asum(buffer);
        if (i) {
            printf ("ascii sum is %d\n", i);
            continue;
        }
    } while(1);
    return 0;
}
/* end C driver */