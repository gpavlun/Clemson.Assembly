/* begin C driver */
#include <stdio.h>
int i, j, k, tri_type;
int main(int argc, char **argv)
{
    printf("Enter the size of triangle side 1 -> ");
    scanf("%d",&i);
    printf("Enter the size of triangle side 2 -> ");
    scanf("%d",&j);
    printf("Enter the size of triangle side 3 -> ");
    scanf("%d",&k);

    classify();
    
    switch(tri_type)
    {
        case 0:
            printf("This is NOT a triangle.\n");
            break;
        case 1:
            printf("This is an Equilateral triangle.\n");
            break;
        case 2:
            printf("This is an Isosceles triangle.\n");
            break;
        case 3:
            printf("This is a Scalene triangle.\n");
            break;
        default:
            printf("Invalid triangle type returned.\n");
    }
    return 0;
}
/* end C driver */