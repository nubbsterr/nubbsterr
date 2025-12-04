#include <raylib.h>

#define SCREENH 450
#define SCREENW 800

int main() {
  InitWindow(SCREENW, SCREENH, "3d shape demo in raylib - nubb");

  // create camera looking straight ahead
  Camera3D camera;
  camera.position = (Vector3){0.0f, 10.0f, 10.0f};
  camera.target = (Vector3){0.0f, 0.0f, 0.0f};
  camera.up = (Vector3){0.0f, 1.0f, 0.0f};
  camera.fovy = 45;
  camera.projection = CAMERA_PERSPECTIVE;

  // absolute slideshow
  SetTargetFPS(60);
  // lock the cursor to the window!
  //DisableCursor();

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KEY_SPACE)) {
      // kinda jank but pretty neat lol
      ToggleFullscreen();
    }
    
    // basically initialize the camera and our window
    BeginDrawing();
      // free cam, we can move w/ WASD and move the camera around w/ the mouse
      UpdateCamera(&camera, CAMERA_ORBITAL);
      ClearBackground(BLACK);
      BeginMode3D(camera);
        
        // le cube
        DrawCube((Vector3){0.0f, 0.0f, 0.0f}, 2.0f, 2.0f, 2.0f, MAROON);
        DrawCube((Vector3){-3.0f, 0.0f, 2.0f}, 2.0f, 2.0f, 2.0f, MAGENTA);
        DrawSphere((Vector3){4.0f, -2.0f, 0.0f}, 1.0f, LIME);

        // tiny grid
        DrawGrid(10, 1);

      EndMode3D();

      // le text
      DrawText("one of the cubes of all time", 190, SCREENH-100, 32, RAYWHITE);
      DrawText("SPACE to toggle fullscreen", 190, SCREENH-50, 32, RAYWHITE);
      
      // top left cardboard
      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindow();
  return 0;
}
