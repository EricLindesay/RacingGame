PImage collisionImage;
PImage displayImage;

float playerX = 25;
float playerY = 20;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
//float playerJumpSpeed = -5;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;

float playerX2 = 25;
float playerY2 = 50;
float playerVelocityY2 = 0;
float playerVelocityX2 = 0;
float playerSpeed2 = 3;
//float playerJumpSpeed = -5;
float playerSize2 = 10;
float wKey;
float dKey;
float sKey;
float aKey;
//boolean onGround;
//float gravity = .3;

boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



void setup()
{
  size(500, 500);
  collisionImage = requestImage("level.png");
  displayImage = requestImage("levelDetail.png");
  
}

void draw()
{
//  fill(0);

  playerVelocityY2 = (sKey - wKey) * playerSpeed2;
  playerVelocityX2 = (dKey - aKey) * playerSpeed2;
  float nextY2 = playerY2 + playerVelocityY2;
  float nextX2 = playerX2 + playerVelocityX2;
  
  //boolean tempOnGround = false;
  if (collisionImage.width > 0)
  {
    image(collisionImage, 0, 0, width, height);
    if (displayImage.width > 0)
    {
      image(displayImage, 0, 0, width, height);
    }
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1) 
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      { 
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
        float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
        float px2 = nextX2;
        float py2 = playerY2;
        float platformX = x * (int)scaleDiff;
        float platformY = y * (int)scaleDiff;
        float tileSize = 0;
        float playerSize = 10;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px2, py2, px2 + playerSize, py2 + playerSize) == true && red(pixelColor) == 0)  // Blocks player from going into the colour block 
        {
          // moving left and character is currently on the right side of the wall          
          if (playerVelocityX2 < 0 && playerX2 >= platformX + tileSize)
          {
            playerVelocityX2 = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX2 > 0 && playerX2 < platformX)
          {
            playerVelocityX2 = 0;
          }
        }
        
        px2 = playerX2;
        py2 = nextY2;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px2, py2, px2 + playerSize, py2 + playerSize) && red(pixelColor) == 0)
        {
          //fill(255, 0, 0);
          
           // moving up and character is currently on the bottom side of the wall
           // commented out to jump up through platforms
          /*if (playerVelocityY < 0  && playerY >= platformY)
          {
            playerVelocityY = 0;
          }*/
          // moving down and character is currently on the top side of the wall
           if (playerVelocityY2 > 0 && playerY2 < platformY)
          {
            playerVelocityY2 = 0;
           // tempOnGround = true;
          }
          if (playerVelocityY2 < 0 && playerY2 >= platformY + tileSize)
          {
            playerVelocityY2 = 0;
          
          }
        }
      }
    }
    
   // fill(0);

  playerVelocityY = (downKey - upKey) * playerSpeed;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;
  
  if (collisionImage.width > 0)
  {
    image(collisionImage, 0, 0, width, height);
    if (displayImage.width > 0)
    {
      image(displayImage, 0, 0, width, height);
    }
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1) 
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      { 
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
        float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
        float px = nextX;
        float py = playerY;
        float platformX = x * (int)scaleDiff;
        float platformY = y * (int)scaleDiff;
        float tileSize = 0;
        float playerSize = 10;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) == true && red(pixelColor) == 0)
        {
          // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX >= platformX + tileSize)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
        
        px = playerX;
        py = nextY;
        if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) && red(pixelColor) == 0)
        {
          //fill(255, 0, 0);
          
           // moving up and character is currently on the bottom side of the wall
           // commented out to jump up through platforms
          /*if (playerVelocityY < 0  && playerY >= platformY)
          {
            playerVelocityY = 0;
          }*/
          // moving down and character is currently on the top side of the wall
           if (playerVelocityY > 0 && playerY < platformY)
          {
            playerVelocityY = 0;
          }
          if (playerVelocityY < 0 && playerY >= platformY + tileSize)
          {
            playerVelocityY = 0;
          }
        }
      }
    }
  }
  fill(255,0,0);
  playerX2 += playerVelocityX2;
  playerY2 += playerVelocityY2;
  rect(playerX2, playerY2, playerSize2, playerSize2);
  
  fill(0,0,255);
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  rect(playerX, playerY, playerSize, playerSize);
  
}
}

void keyReleased()
{
  
    if (key == 'a')
    {
      aKey = 0;
    }
    if (key == 'd')
    {
      dKey = 0;
    }
    if (key == 'w')
    {
      wKey = 0;
    }
    if (key == 's')
    {
      sKey = 0;
    }
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
 
void keyPressed()
{ 
   
    if (key == 'a')
    {
      aKey = 1;
    }
    if (key == 'd')
    {
      dKey = 1;
    }
    if (key == 'w')
    {
      wKey = 1;
    }
    if (key == 's')
    {
      sKey = 1;
    }   
   
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }}
