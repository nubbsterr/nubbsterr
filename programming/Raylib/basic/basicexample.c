// compile w/ ... -lraylib -o example

#include "raylib.h"

int main(void)
{
    InitWindow(800, 450, "raylib [core] example - basic window - nubb");
    Font jetbrainsmono = LoadFont("/usr/share/fonts/TTF/JetBrainsMonoNerdFont-Bold.ttf");
    Vector2 jetbrainspos = {
        190, 280
    };
    while (!WindowShouldClose())
    {
        BeginDrawing();
            ClearBackground(BLACK);
            DrawText("Congrats! You created your first window!", 190, 200, 20, RAYWHITE);
            DrawText("This is some more text drawn by me >:)", 190, 250, 16, RAYWHITE);
            DrawTextEx(jetbrainsmono, "This is some text with a different font!", jetbrainspos, 16, 1, RAYWHITE);
        EndDrawing();
    }

    // unload font from ram, which would still be cleaned up when the program terminates
    // but ofc it's better if we ACTUALLY clean it up
    UnloadFont(jetbrainsmono);
    CloseWindow();

    return 0;
}
