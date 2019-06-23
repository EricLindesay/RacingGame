class Player {
  float xpos = 0;
  float ypos = 0;

  boolean colour = false;
  boolean colours = false;
  boolean checkpoint = false;
  boolean slow = false;
  boolean fast = false;

  color playerColour;
  int lap_count = 0;

  float velocityY = 0;
  float velocityX = 0;
  float speed = 6;
  float size = 7;
  float nextY;
  float nextX;
  boolean lap = false;
  boolean finished = false;
  boolean sizeChange;
  float prev_y;
  float prev_x;

  String name;

  boolean wasd;
  boolean down;
  boolean up;
  boolean left;
  boolean right;

  Player(boolean keys, color colour, String name1) {
    wasd = keys;
    playerColour = colour;
    name = name1;
  }

  void coordinates(float startCoordsX, float startCoordsY) {
    xpos = startCoordsX;
    ypos = startCoordsY;
  }
}

void show(Player player) {
  fill(player.playerColour);
  rect(player.xpos, player.ypos, player.size, player.size);
}
