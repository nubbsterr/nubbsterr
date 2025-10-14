// memory allocation; DYNAMICALLY allocate bytes of memory
// core thing to remember is to free and set the pointer(s) to NULL once mallc is done with!!!!!!!!!!
#include <stdio.h>
#include <stdlib.h> // for malloc
int main() {
    int numberofbytes = 0;
    printf("Num of grades > ");
    scanf("%d", &numberofbytes);

    // when we allocate memory with malloc, we are now using the HEAP and not the stack. malloc will return a pointer to where our memory is reserved into the variable
    // when we're done with the memory, we need to free this allocated memory, specifying what variable was being allocated to that memory region
    char* grades = malloc(numberofbytes * sizeof(char));

    // dereferencing a NULL pointer causes seg fault
    if (grades == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    for (int i = 0; i < numberofbytes; i++) {
        printf("Enter grade %d > ", i + 1);
        scanf(" %c", &grades[i]); // address to the pointer; basically we are now accessing the data structure at the address
    }

    for (int i = 0; i < numberofbytes; i++) {
        printf("Grade %d: %c\n", i+1, grades[i]);
    }

    free(grades);

    // now we need to RESET this pointer since we aren't using it, otherwise we have a dangling pointer which is BAD because it points to memory that isn't being used anymore
    grades = NULL;
    return 0;
}
