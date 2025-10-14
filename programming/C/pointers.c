// src: https://www.youtube.com/watch?v=xND0t1pr3KY&t=17953s
// pointers store addresses of another variable; allow u to pass addresses of variables rather than copying the entire variable, which is commonly seen in asm by referencing the ADDRESS and not giving the value immediately

// note that we need to specify the dereference operator to suggest a pointer will be provided!!!!!!!!!!!!!!
void birthday(int* a);

#include <stdio.h>
int main() {
    int age = 1000;

    // * = dereference operator, this is how we store a pointer in a variable
    int* p_age = &age; // pointer stores address of the age variable!

    birthday(p_age); // we can also do &age over p_age!!
    printf("You are %d years old.", age);
    return 0;
}

void birthday(int* age) {
    // functions are pass-by-value; they copy the argument given, rather than changing the ORIGINAL value
    // we can instead pass by REFERENCE by passing a POINTER to the variable that we want to change
    // note that if we run age++ here, we increment the ADDRESS and not the value at the address!
    (*age)++; // this will firstly dereference the variable and get its value at the address, specified in the pointer, the brackets will take precedence and dereference first before incrementing
}
