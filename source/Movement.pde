void movement(PImage collisionImage, PImage displayImage, Player player)
{
  if (countdown == true) {
    if (player.wasd == false) {
      player.velocityY = (downKey - upKey) * player.speed;
      player.velocityX = (rightKey - leftKey) * player.speed;
    } else {
      player.velocityY = (sKey - wKey) * player.speed;
      player.velocityX = (dKey - aKey) * player.speed;
    }
    player.nextY = player.ypos + player.velocityY;
    player.nextX = player.xpos + player.velocityX;

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
          float px = player.nextX;
          float py = player.ypos;
          float platformX = x * (int)scaleDiff;
          float platformY = y * (int)scaleDiff;
          float tileSize = 0;
        //  float playerSize = 7;

          if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + player.size, py + player.size) == true && red(pixelColor) == 0)
          {
            if (player.velocityX < 0 && player.xpos >= platformX + tileSize)
            {
              player.velocityX = 0;
            }
            if (player.velocityX > 0 && player.xpos < platformX)
            {
              player.velocityX = 0;
            }
          }

          px = player.xpos;
          py = player.nextY;
          if (isRectOverlapping(platformX, platformY, platformX + tileSize, platformY + tileSize, px, py, px + player.size, py + player.size) && red(pixelColor) == 0)
          {
            if (player.velocityY > 0 && player.ypos < platformY)
            {
              player.velocityY = 0;
            }
            if (player.velocityY < 0 && player.ypos >= platformY + tileSize)
            {
              player.velocityY = 0;
            }
          }
        }
      }

      player.xpos += player.velocityX;
      player.ypos += player.velocityY;
    }
  }
}
