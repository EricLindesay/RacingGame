PImage startImage;
PImage collisionImage;
PImage displayImage;
PImage levelSelect;
PImage colourSelect;

boolean player1Colour = false;
boolean player2Colour = false;
boolean colours = false;
color selectedColour;

boolean print_levels = true;  //in choose level show original colour

int time = 0;
int lightColours = 255;
boolean colours1 = false;

boolean menu = false;
int start = millis();

boolean stop = false;

boolean displayed = false;

boolean level = false;
boolean level1 = false;
boolean level2 = false;
boolean level3 = false;
boolean level4 = false;
boolean level5 = false;
boolean level6 = false;
boolean level7 = false;
boolean level8 = false;
boolean level9 = false;
boolean level10 = false;

int x = 250;

boolean levels = false;

boolean startImage1 = true;

float level_timer = 0;

boolean countdown = false;
int countingdown = 0;

boolean finished1 = false;
boolean finished2 = false;

boolean begin = false;
boolean lap1 = false;
float lap_count1 = 0;
float lap_count2 = 0;
boolean lap2 = false;

float timer = 0;

boolean checkpoint1 = false;
boolean checkpoint2 = false;

boolean slow1 = false;
boolean slow2 = false;
boolean fast1 = false;
boolean fast2 = false;
boolean sizeChange = false;

int lastlap1 = 0;
int lastlap2 = 0;

int seconds = second();
int minutes = minute();
int delay = 0;
int a;


float playerX;
float playerY;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed1 = 6;
float playerSize = 7;
float upKey;
float rightKey;
float downKey;
float leftKey;

float playerX2;
float playerY2;
float playerVelocityY2 = 0;
float playerVelocityX2 = 0;
float playerSpeed2 = 6;
float playerSize2 = 7;
float wKey;
float dKey;
float sKey;
float aKey;

String level1_winner = "";
String level2_winner = "";
String level3_winner = "";
String level4_winner = "";
String level5_winner = "";
String level6_winner = "";
String level7_winner = "";
String level8_winner = "";
String level9_winner = "";
String level10_winner = "";

int x_destination;
int y_destination;

float playery_bridge = playerY;
float prev_y = 0;
float playery2_bridge = playerY2;
float prev_y2 = 0;
float prev_x = 0;
float prev_x2 = 0;

color player1;
color player2;

void setup()
{
  size(750, 710);
  startImage = requestImage("startScreen.png");
  levelSelect = requestImage("levelSelect.png");
  colourSelect = requestImage("colourSelection.png");
  //time = second();
  player1 = color(0, 0, 255);
  player2 = color(255, 0, 0);
}


void draw()
{
  if (startImage.width > 0 && startImage1 == true)
  {
    image(startImage, 0, 0, width, height);
    startImage1 = false;
    colourBox();
  }
  if (begin == true) {
    if (level == false) {
      image(levelSelect, 0, 0, width, height);
      printColourWinner();
      print_level_select();
      print_levels = false;

      if (level_timer == 0) {
        level_timer = start - millis();
      }     
      textSize(400);
      if (millis()-level_timer >= 250) {
        levels = true;
        level_timer = 0;
      }
    }

    movement(collisionImage, displayImage);

    startLevels();

    if (lap_count1 >= 5 || lap_count2 >= 5) {
      laps_finished();
    }
  }

  if (player1Colour == true || player2Colour == true) {
    image(colourSelect, 0, 0, width, height);

    if (level_timer == 0 && colours == false) {
      level_timer = start - millis();
    }     
    textSize(400);
    if (millis()-level_timer >= 250) {
      colours = true;
      level_timer = 0;
    }
  }


  if (menu == true) {
    menu(3);
  }
}

void printColourWinner() {
  colourWinner(level1_winner, -1, 1);
  colourWinner(level2_winner, 378, 1);
  colourWinner(level3_winner, -1, 144);
  colourWinner(level4_winner, 378, 144);
  colourWinner(level5_winner, -1, 286);
  colourWinner(level6_winner, 378, 286);
  colourWinner(level7_winner, -1, 428);
  colourWinner(level8_winner, 378, 428);
  colourWinner(level9_winner, -1, 571);
  colourWinner(level10_winner, 378, 571);
}


boolean isRectOverlapping(float left, float top, float right, float bottom, 
  float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

void startLevels() {
  if (level1 == true && begin == true) {   
    level_1();
    displayLaps(125, 125);
  }

  if (level2 == true && begin == true) {   
    level_2();
    displayLaps(487, 250);
  }

  if (level3 == true && begin == true) {
    level_3();
    displayLaps(300, 200);
  }
  if (level4 == true && begin == true) {
    level_4();
    displayLaps(10, 75);
  }
  if (level5 == true && begin == true) {
    level_5();
    displayLaps(23, 100);
  }
  if (level6 == true && begin == true) {
    level_6();
    displayLaps(300, 250);
  }
  if (level7 == true && begin == true) {
    level_7();
    displayLaps(300, 150);
  }
  if (level8 == true && begin == true) {
    level_8();
    displayLaps(120, 100);
  }
  if (level9 == true && begin == true) {
    level_9();
    displayLaps(160, 100);
  }
  if (level10 == true && begin == true) {
    level_10();
    displayLaps(340, 120);
  }
}

void menu(int time_7) {
  if (time == 0) {
    time = second();
  }
  if (second()-time == time_7) {
    menu = false;
    begin = false;
    player1Colour = false;
    player2Colour = false;
    playerSize = 7;
    playerSize2 = 7;
    colours = false;
    image(startImage, 0, 0, width, height);
    colourBox();
    level = false;
    levels = false;
    level1 = false;
    level2 = false;
    level3 = false;
    level4 = false;
    level5 = false;
    level6 = false;
    level7 = false;
    level8 = false;
    level9 = false;
    level10 = false;
    finished1 = false;
    finished2 = false;
    level_timer = 0;
    timer = 0;
    lap_count1 = 0;
    lap_count2 = 0;
    displayed = false;
    stop = false;
    countdown = false;
    checkpoint1 = false;
    checkpoint2 = false;
    time = 0;
  }
}

void setImages(String collisionImageStr, String displayImageStr) {
  collisionImage = requestImage(collisionImageStr);
  displayImage = requestImage(displayImageStr);
  displayed = true;
}

void keyReleased()
{

  if (key == 'a' || key == 'A')
  {

    aKey = 0;
  }
  if (key == 'd' || key == 'D')
  {
    dKey = 0;
  }
  if (key == 'w' || key == 'W')
  {
    wKey = 0;
  }
  if (key == 's' || key == 'S')
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

  if (key == 'a' || key == 'A')
  {
    aKey = 1;
  }
  if (key == 'd' || key == 'D')
  {
    dKey = 1;
  }
  if (key == 'w' || key == 'W')
  {
    wKey = 1;
  }
  if (key == 's' || key == 'S')
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
  }

  if (key == ' ') {
    menu(0);
  }
}

void mouseClicked() {
  if (begin == false && player1Colour == false && player2Colour == false) {
    if (mouseX >= 0 && mouseX <= 750 && mouseY >= 0 && mouseY <= 200) {
      begin = true;
    }

    if (mouseX >= 0 && mouseX <= 355 && mouseY >= 510 && mouseY <= 710) {
      player1Colour = true;
    }
    if (mouseX >= 395 && mouseX <= 750 && mouseY >= 510 && mouseY <= 710) {
      player2Colour = true;
    }
  }

  if (begin == true) {
    if (level == false && levels == true) {
      selectLevels();
    }
  }
  if (colours == true && player1Colour == true) {
    selectColours();
    player1 = selectedColour;
    menu = true;
    time = second()-3;
  }
  if (colours == true && player2Colour == true) {
    selectColours();
    player2 = selectedColour;
    menu = true;
    time = second()-3;
  }
}

void selectColours() {
  if (mouseX >= 20 && mouseX <= 200 && mouseY >= 20 && mouseY <= 200) {
    selectedColour = color(255, 0, 0); //red
  }
  if (mouseX >= 220 && mouseX <= 530 && mouseY >= 20 && mouseY <= 200) {
    selectedColour = color(0); //black
  }
  if (mouseX >= 550 && mouseX <= 730 && mouseY >= 20 && mouseY <= 200) {
    selectedColour = color(0, 0, 255); //blue
  }
  if (mouseX >= 20 && mouseX <= 200 && mouseY >= 220 && mouseY <= 490) {
    selectedColour = color(0, 255, 0); //green
  }
  if (mouseX >= 550 && mouseX <= 730 && mouseY >= 220 && mouseY <= 490) {
    selectedColour = color(0, 255, 255); //turquoise
  }
  if (mouseX >= 20 && mouseX <= 200 && mouseY >= 490 && mouseY <= 690) {
    selectedColour = color(255, 255, 0); //yellow
  }
  if (mouseX >= 220 && mouseX <= 530 && mouseY >= 490 && mouseY <= 690) {
    selectedColour = color(255); //white
  }
  if (mouseX >= 550 && mouseX <= 730 && mouseY >= 490 && mouseY <= 690) {
    selectedColour = color(255, 0, 255); //purple
  }
}

void selectLevels() {
  if (mouseX >= 0 && mouseX <= 375 && mouseY >= 0 && mouseY <= 142) {
    level1 = true;
    level = true;
  }
  if (mouseX >= 375 && mouseX <= 750 && mouseY >= 0 && mouseY <= 142) {
    level2 = true;
    level = true;
  }
  if (mouseX >= 0 && mouseX <= 375 && mouseY >= 143 && mouseY <= 284) {
    level3 = true;
    level = true;
  }
  if (mouseX >= 375 && mouseX <= 750 && mouseY >= 143 && mouseY <= 284) {
    level4 = true;
    level = true;
  }
  if (mouseX >= 0 && mouseX <= 375 && mouseY >= 285 && mouseY <= 426) {
    level5 = true;
    level = true;
  }
  if (mouseX >= 375 && mouseX <= 750 && mouseY >= 285 && mouseY <= 426) {
    level6 = true;
    level = true;
  }
  if (mouseX >= 0 && mouseX <= 375 && mouseY >= 427 && mouseY <= 568) {
    level7 = true;
    level = true;
  }
  if (mouseX >= 375 && mouseX <= 750 && mouseY >= 427 && mouseY <= 568) {
    level8 = true;
    level = true;
  }
  if (mouseX >= 0 && mouseX <= 375 && mouseY >= 569 && mouseY <= 710) {
    level9 = true;
    level = true;
  }
  if (mouseX >= 375 && mouseX <= 750 && mouseY >= 569 && mouseY <= 710) {
    level10 = true;
    level = true;
  }
}
