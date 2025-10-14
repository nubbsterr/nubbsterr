// resize previously allocated memory, similar to a dynamic array

#include <stdlib.h>
#include <stdio.h>

int main() {
    int numprods = 0;
    printf("Num products: ");
    scanf("%d", &numprods);

    float* price = malloc(numprods * sizeof(float));

    if (price == NULL) {
        printf("Malloc failed!\n");
        return 1;
    }

    for (int i = 0; i < numprods; i++) {
        printf("Enter price of prod #%d: ", i+1);
        scanf("%f", &price[i]);
    }

    // when prompted for the new size of memory here, if it's less than what we started with, then the logic down the line gets cut off of course
    int moreram = 0;
    printf("More ram????????\n> ");
    scanf("%d", &moreram);

    float* temp = realloc(price, moreram * sizeof(float));
    if (temp == NULL) {
        printf("Realloc failed!\n");
        return 1;
    }
    else {
        price = temp; // our old memory now points to the new memory
        temp = NULL;  // for safety, just like with malloc

        // start from where we left off and continue!
        for (int i = numprods; i < moreram; i++) {
            printf("Enter price of NEW prod #%d: ", i+1);
            scanf("%f", &price[i]);
        }

        // now print out all the new stuff and old stuff together
        for (int i = 0; i < moreram; i++) {
            printf("Price for product #%d: %f\n", i+1, price[i]);
        }
    }

    free(price);
    price = NULL;

    return 0;
}
