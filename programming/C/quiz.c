// src: https://www.youtube.com/watch?v=xND0t1pr3KY&t=17953s

#include <stdio.h>
#include <ctype.h> // toUpper 
int main() {

    // each question has max 100 characters
    char questions[][100] = {"wut's a c2????????", "how to hack AD????????", "how to rev malware?????"};
    char options[][100] = {"A. command and control\nB. cc\nC. clankercrankers\nD. idk man", "A. haxor\nB. idk man\nC. bloodhound\nD. aredeepee", "A. x64dbg\nB. binja\nC. strings+grep\nD. grok"};
    char answers[] = {'A', 'C', 'B'};

    // fancy way of gettin num of elements in array
    int questionCount = sizeof(questions) / sizeof(questions[0]);
    char guess = '\0';
    int score = 0;

    printf("A lovely quiz game frfr");

    for (int i = 0; i < questionCount; i++) {
        printf("%s\n", questions[i]);
        printf("\n%s\n", options[i]);
        printf("\nEnter guess: ");
        // space here is needed to ignore the newline entered, otherwise this legit ingests the newline/Enter as the input
        scanf(" %c", &guess);

        guess = toupper(guess);

        if (guess == answers[i]) 
            score++;
    }

    printf("Final score: %d", score);

    return 0;
}
