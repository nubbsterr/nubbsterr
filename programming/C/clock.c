#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <unistd.h>

int main() {
    time_t rawtime = 0; // long int basically, which is mega big, time_t is legit meant to hold unix epoch time; seconds since jan 1 1970
    struct tm* p_time = NULL; // best practice than setting it to nothing, BUT MAKE SURE TO ASSIGN SOMETHING TO IT OTHERWISE U DEREFERENCE A NULL POINTER AND EXPLODE
    bool isRunning = true;

    while (isRunning) {
        time(&rawtime); // updated unix timestamp

        p_time = localtime(&rawtime); // return pointer to time struct of hrs/mins/secs

        // Arrow operator will deref the pointer p_time so we can then get the struct fields, if we do *p_time.field, then we get the field and then deref which is no good
        // zero pad everything so its all aligned ye
        printf("\r%02d:%02d:%02d", p_time->tm_hour, p_time->tm_min, p_time->tm_sec);
        fflush(stdout);  // to flush the output buffer, on Linux this is needed for some reason lul
        sleep(1);
    }

    return 0;
}
