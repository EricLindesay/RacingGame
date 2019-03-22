
void movement(PImage collisionImage, PImage displayImage)
{
  if (countdown == true) {

    playerVelocityY2 = (sKey - wKey) * playerSpeed2;
    playerVelocityX2 = (dKey - aKey) * playerSpeed2;
    float nextY2 = playerY2 + playerVelocityY2;
    float nextX2 = playerX2 + playerVelocityX2;

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
        for (int x = 0; x < collisionImage.width; x += 1)
        { 
          color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
          float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
          float px2 = nextX2;
          float py2 = playerY2;
          float platformX = x * (int)scaleDiff;
          float platformY = y * (int)scaleDiff;
          float tileSize = 0;
          float playerSize = 7;
          if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px2, py2, px2 + playerSize, py2 + playerSize) == true && red(pixelColor) == 0)  // Blocks player from going into the colour block 
          {
            if (playerVelocityX2 < 0 && playerX2 >= platformX + tileSize)
            {
              playerVelocityX2 = 0;
            }
            if (playerVelocityX2 > 0 && playerX2 < platformX)
            {
              playerVelocityX2 = 0;
            }
          }

          px2 = playerX2;
          py2 = nextY2;
          if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px2, py2, px2 + playerSize, py2 + playerSize) && red(pixelColor) == 0)
          {
            if (playerVelocityY2 > 0 && playerY2 < platformY)
            {
              playerVelocityY2 = 0;
            }
            if (playerVelocityY2 < 0 && playerY2 >= platformY + tileSize)
            {
              playerVelocityY2 = 0;
            }
          }
        }
      }

      playerVelocityY = (downKey - upKey) * playerSpeed1;
      playerVelocityX = (rightKey - leftKey) * playerSpeed1;
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
          for (int x = 0; x < collisionImage.width; x += 1)
          { 
            color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
            float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
            float px = nextX;
            float py = playerY;
            float platformX = x * (int)scaleDiff;
            float platformY = y * (int)scaleDiff;
            float tileSize = 0;
            float playerSize = 7;

           // if(red(pixelColor) == 255){print(pixels[2]);}

            if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) == true && red(pixelColor) == 0)
            {
              if (playerVelocityX < 0 && playerX >= platformX + tileSize)
              {
                playerVelocityX = 0;
              }
              if (playerVelocityX > 0 && playerX < platformX)
              {
                playerVelocityX = 0;
              }
            }

            px = playerX;
            py = nextY;
            if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + playerSize, py + playerSize) && red(pixelColor) == 0)
            {
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
      fill(player2);
      playerX2 += playerVelocityX2;
      playerY2 += playerVelocityY2;
      rect(playerX2, playerY2, playerSize2, playerSize2);

      fill(player1);
      playerX += playerVelocityX;
      playerY += playerVelocityY;
      rect(playerX, playerY, playerSize, playerSize);
    }
  }
}
