#include <raylib.h>

#define SCREENH 450
#define SCREENW 800

int main() {
  InitWindow(SCREENW, SCREENH, "3d cube demo in raylib - nubb");

  SetTargetFPS(60);
  
  // lock the cursor to the window!
  DisableCursor();

  // load image into RAM
  Image img = LoadImage("./latest.png");
  ImageResize(&img, 350, 350);
  // raylib handles images weirdly; currently, it is loaded
  // in RAM, but if we convert it to a texture, then we load
  // it into VRAM
  Texture2D imgtext = LoadTextureFromImage(img);
  // now we can unload the IMAGE from RAM to save resources
  UnloadImage(img);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KEY_SPACE)) {
      ToggleFullscreen();
    }

    // basically initialize the camera and our window
    BeginDrawing();
      // free cam, we can move w/ WASD and move the camera around w/ the mouse
      ClearBackground(BLACK);
        
      // draw the texture (image)      
      DrawTexture(imgtext, SCREENW/2 - imgtext.width/2, SCREENH/2 - imgtext.height/2, RAYWHITE);
        
      // le text
      DrawText("SPACE to toggle fullscreen", 190, SCREENH-50, 32, RAYWHITE);
      
      // top left cardboard
      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(imgtext);
  CloseWindow();
  return 0;
}
