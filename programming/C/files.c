#include <stdio.h>
int main() {
    FILE* p_file = fopen("/tmp/output.txt", "w"); // file path, mode; read, write, etc. If fopen fails, then NULL is returned, so we check below for this invariance
 
    if (p_file == NULL) {
        printf("Error opening file!!!!!!");
        return 1; // early return w/ code 1 to indicate an error
    }

    char text[] = "some text frfr\nteto\ni love C";
    fprintf(p_file, "%s", text); // pointer to file, format specifier for wut to give, and the stuff to input/write

    fclose(p_file); // takes pointer to the file that was opened, which is why we snatched the pointer in the line above!

    printf("File write was successful.\n");

    // FILE READ STUFF BELOW!!!!!!!!!!!!!!!!

    FILE *p_fileRead = fopen("/tmp/output.txt", "r");
    char buffer[1024] = {0}; // 1-byte buffer to read the data from the file, zero initialized

    // fgets returns null if nothing can be extracted
    while (fgets(buffer, sizeof(buffer), p_fileRead) != NULL) {
        printf("%s", buffer);
    }

    if (p_fileRead == NULL) {
        printf("File read failed.");
        return 1;
    }
    
    fclose(p_fileRead);
    return 0;
}
