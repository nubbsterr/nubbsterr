// "clear allocation"; dynamically allocates bytes BUT zeros at all the allocated bytes to 0, which is nice to prevent undefined behaviour

#include <stdlib.h>
#include <stdio.h>

int main() {
    int numplayers = 0;
    printf("Players: ");
    scanf("%d", &numplayers);

    int* scores = calloc(numplayers, sizeof(int));

    if (scores == NULL) {
        printf("Calloc failed.\n");
        return 1;
    }

    for (int i = 0; i < numplayers; i++) {
        printf("Score of player #%d: ", i+1);
        scanf(" %d", &scores[i]);
    }

    for (int i = 0; i < numplayers; i++) {
        printf("Player #%d score: %d\n", i+1, scores[i]);
    }

    // free and nullify the pointer for malloc
    free(scores);
    scores = NULL;
}
