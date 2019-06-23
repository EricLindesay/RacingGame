import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RacingGameBetter extends PApplet {

PImage startImage, collisionImage, displayImage, levelSelect, colourSelect;

ArrayList <Player> players = new ArrayList<Player>();

boolean menu = false;
boolean stop = false;
boolean displayed = false;
boolean startImage1 = true;
boolean countdown = false;

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
boolean levels = false;

boolean begin = false;

boolean displayColours = false;
boolean colours = false;
boolean colours1 = false;
boolean print_levels = true;

boolean sizeChange = false;
boolean player1Colour = false;
boolean player2Colour = false;

int selectedColour;

int time = 0;
int lightColours = 255;
int start = millis();
int x = 250;
int countingdown = 0;
int seconds = second();
int minutes = minute();
int delay = 0;
int a;
int x_destination;
int y_destination;


float level_timer = 0;
float lap_count1 = 0;
float lap_count2 = 0;
float timer = 0;

float upKey;
float rightKey;
float downKey;
float leftKey;

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

public void setup()
{
  
  players.add(new Player(true, color(255, 0, 0), "Player1"));
  players.add(new Player(false, color(0, 0, 255), "Player2"));
  startImage = requestImage("/maps/startScreen.png");
  levelSelect = requestImage("/maps/levelSelect.png");
  colourSelect = requestImage("/maps/colourSelection.png");
}


public void draw()
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

    for (int i = 0; i < 2; i++) {
      Player player = players.get(i);
      movement(collisionImage, displayImage, player);
    }
    Player player1 = players.get(0);
    show(player1);
    Player player2 = players.get(1);
    show(player2);

    startLevels();

    laps_finished();
  }

  if (player1Colour == true || player2Colour == true) {
    image(colourSelect, 0, 0, width, height);

    if (level_timer == 0 && colours == false) {
      level_timer = millis();
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

public void printColourWinner() {
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


public boolean isRectOverlapping(float left, float top, float right, float bottom, 
  float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

public void startLevels() {
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

public void menu(int time_7) {
  if (time == 0) {
    time = second();
  }
  if (second()-time == time_7) {
    menu = false;
    begin = false;

    for (int i = 0; i < 2; i++) {
      Player player = players.get(i);
      player.colour = false;
      player.size = 7;
      player.finished = false;
      player.lap_count = 0;
      player.checkpoint = false;
      player.xpos = -10;
      player.ypos = -10;
    }

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
    level_timer = 0;
    timer = 0;
    displayed = false;
    stop = false;
    countdown = false;
    time = 0;
    player1Colour = false;
    player2Colour = false;
  }
}

public void setImages(String collisionImageStr, String displayImageStr) {
  collisionImage = requestImage(collisionImageStr);
  displayImage = requestImage(displayImageStr);
  displayed = true;
}

public void keyReleased()
{
  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);

    if (player.wasd == true) {
      if (key == 'a' || key == 'A')
      {
        aKey = 0;
        player.left = false;
      }
      if (key == 'd' || key == 'D')
      {
        dKey = 0;
        player.right = false;
      }
      if (key == 'w' || key == 'W')
      {
        wKey = 0;
        player.up = false;
      }
      if (key == 's' || key == 'S')
      {
        sKey = 0;
        player.down = false;
      }
    }
    if (key == CODED && player.wasd == false)
    {
      if (keyCode == LEFT)
      {
        leftKey = 0;
        player.left = false;
      }
      if (keyCode == RIGHT)
      {
        rightKey = 0;
        player.right = false;
      }
      if (keyCode == UP)
      {
        upKey = 0;
        player.up = false;
      }
      if (keyCode == DOWN)
      {
        downKey = 0;
        player.down = false;
      }
    }
  }
}

public void keyPressed()
{   
  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);

    if (player.wasd == true) {
      if (key == 'a' || key == 'A')
      {
        aKey = 1;
        player.left = true;
      }
      if (key == 'd' || key == 'D')
      {
        dKey = 1;
        player.right = true;
      }
      if (key == 'w' || key == 'W')
      {
        wKey = 1;
        player.up = true;
      }
      if (key == 's' || key == 'S')
      {
        sKey = 1;
        player.down = true;
      }
    }
    if (key == CODED && player.wasd == false)
    {
      if (keyCode == LEFT)
      {
        leftKey = 1;
        player.left = true;
      }
      if (keyCode == RIGHT)
      {
        rightKey = 1;
        player.right = true;
      }
      if (keyCode == UP)
      {
        upKey = 1;
        player.up = true;
      }
      if (keyCode == DOWN)
      {
        downKey = 1;
        player.down = true;
      }
    }

    if (key == ' ') {
      menu(0);
    }
  }
}

public void mouseClicked() {
  if (begin == false && displayColours == false) {
    if (mouseX >= 0 && mouseX <= 750 && mouseY >= 0 && mouseY <= 200) {
      begin = true;
    }

    if (mouseX >= 0 && mouseX <= 355 && mouseY >= 510 && mouseY <= 710) {
      player1Colour = true;
      //displayColours = true;
    }
    if (mouseX >= 395 && mouseX <= 750 && mouseY >= 510 && mouseY <= 710) {
      player2Colour = true;
      //displayColours = true;
    }
  }

  if (begin == true) {
    if (level == false && levels == true) {
      selectLevels();
    }
  }

  if (colours == true) {
    if (player1Colour == true) {
      Player player = players.get(0);
      player.playerColour = selectColours();
      player1Colour = false;
    }
    if (player2Colour == true) {
      Player player = players.get(1);
      player.playerColour = selectColours();
      player2Colour = false;
    }
    menu = true;
    time = second()-3;
  }
}

public int selectColours() {
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
  return selectedColour;
}

public void selectLevels() {
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

public void displayLaps(int x, int y) {
  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    textSize(15);
    fill(player.playerColour);
    text("Player "+(i+1)+": " + PApplet.parseInt(player.lap_count) + " laps", x, y);
    y = y + 15;
  }
}

public void colourBox() {
  Player player1 = players.get(0);
  strokeWeight(3);
  fill(player1.playerColour);
  rect(20, 510, 335, 180);
  Player player2 = players.get(1);
  fill(player2.playerColour);
  rect(395, 510, 335, 180);

  textSize(40);
  if (player1.playerColour == color(0, 0, 0)) {
    fill(255);
    text("Player 1 \n(Arrows) \nColour", 100, 550);
  } else {
    fill(0);
    text("Player 1 \n(Arrows) \nColour", 100, 550);
  }
  if (player2.playerColour == color(0, 0, 0)) {
    fill(255);
    text("Player 2 \n(WASD) \nColour", 485, 550);
  } else {
    fill(0);
    text("Player 2 \n(WASD) \nColour", 485, 550);
  }
  strokeWeight(1);
}
public void colourWinner(String level_winner, int x_coord, int y_coord) {
  Player player1 = players.get(0);
  Player player2 = players.get(1);

  if (level_winner == "Player2") {
    fill(player2.playerColour);
  }
  if (level_winner == "Player1") {
    fill(player1.playerColour);
  } 
  if (level_winner == "") {
    fill(255);
  }
  if (level_winner != "") {
    rect(x_coord, y_coord, 373, 138);
  }
}

public void print_level_select() {
  fill(20,20,20);
  textSize(75);
  text("Level 1", 50, 101);
  text("Level 2", 425, 101);
  text("Level 3", 50, 237);
  text("Level 4", 425, 237);
  text("Level 5", 50, 380);
  text("Level 6", 425, 380);
  text("Level 7", 50, 522);
  text("Level 8", 425, 522);
  text("Level 9", 50, 664);
  text("Level 10", 425, 664);
}

public void countdown(PImage image) {
  if (timer == 0) {
    timer = second();
  }     
  textSize(400);
  if (second()-timer == 1) {
    image(image, 0, 0, width, height);
    fill(255, 0, 0);
    text("3", 200, 400);
  }
  if (second()-timer == 2) {
    image(image, 0, 0, width, height);
    fill(100, 100, 0);
    text("2", 200, 400);
  }
  if (second()-timer == 3) {
    image(image, 0, 0, width, height);
    fill(0, 100, 100);
    text("1", 200, 400);
  }
  if (second()-timer == 4) {
    image(image, 0, 0, width, height);
    textSize(350);
    fill(0, 0, 255);
    text("Go!", 0, 400);
  }
  if (second()-timer == 5) {
    countdown = true;
    timer = 0;
  }
}

public void laps_finished() {
  Player player1 = players.get(0);
  Player player2 = players.get(1);
  textSize(100);
  if (player1.lap_count == 5 && player2.finished != true) {
    fill(player1.playerColour);
    text("Player 1 Wins!", 45, 300);    
    player1.finished = true;  
    print_levels = true;
    menu = true;
  }
  if (player2.lap_count >= 5 && player1.finished != true) {
    fill(player2.playerColour);
    text("Player 2 Wins!", 45, 300);    
    player2.finished = true;  
    print_levels = true;
    menu = true;
  }
}


public void doLights(int amount) {
  lightColours = lightColours + amount;
}

public int timerColours(int changeAmount, int millis) {
  if (timer == 0) {
    timer = millis();
  }
  if (millis()-timer >= millis) {
    timer = 0;

    if (changeAmount >= 255) {
      changeAmount = changeAmount - 20;
    }
    if (changeAmount <= 15) {
      changeAmount = changeAmount + 20;
    }
  }
  return changeAmount;
}


public String level_colour(String level_winner) {
  Player player1 = players.get(0);
  Player player2 = players.get(1);

  if (player1.lap_count >= 5 && player2.finished != true) {
    level_winner = "Player1";
  }
  if (player2.lap_count >= 5 && player1.finished != true) {
    level_winner = "Player2";
  }
  return level_winner;
}

public void lap_gate(Player player, float lap_X_upper, float lap_X_lower, float lap_Y_upper, float lap_Y_lower) {
  if (player.lap == false && player.checkpoint == true) {
    if (player.xpos <= lap_X_upper && player.xpos >= lap_X_lower) {
      if (player.ypos <= lap_Y_upper && player.ypos >= lap_Y_lower) {
        player.lap = true;
      }
    }
  }
}

public void checkpoint_gate(Player player, float check_X_upper, float check_X_lower, float check_Y_upper, float check_Y_lower) {
  if (player.checkpoint == false) {
    if (player.xpos <= check_X_upper && player.xpos >= check_X_lower) {
      if (player.ypos <= check_Y_upper && player.ypos >= check_Y_lower) {
        player.checkpoint = true;
      }
    }
  }
}

public void slow_gate(Player player, float slow_X_upper, float slow_X_lower, float slow_Y_upper, float slow_Y_lower) {
  if (player.xpos <= slow_X_upper && player.xpos >= slow_X_lower) {
    if (player.ypos <= slow_Y_upper && player.ypos >= slow_Y_lower) {
      player.slow = true;
    }
  }
}

public void fast_gate(Player player, float fast_X_upper, float fast_X_lower, float fast_Y_upper, float fast_Y_lower) {
  if (player.xpos <= fast_X_upper && player.xpos >= fast_X_lower) {
    if (player.ypos <= fast_Y_upper && player.ypos >= fast_Y_lower) {
      player.fast = true;
    }
  }
}

public void playerSpeedChange(Player player) {
  if (player.fast == true && player.slow == true) {
    player.speed = 6;
  }
  if (player.fast == false && player.slow == false) {
    player.speed = 6;
  }
  if (player.fast == true && player.slow == false) {
    player.speed = 9;
  }
  if (player.fast == false && player.slow == true) {
    player.speed = 1.5f;
  }
}

public boolean timer(float millis) {
  boolean return_value = false;
  if (timer == 0) {
    timer = millis();
  }
  if ((millis()-timer) >= millis) {
    return_value = true;
    timer = 0;
  }
  return return_value;
}

public void bridge(Player player, float time, float sizeChangeAmount, float X_upper, float X_lower, float Y_upper, float Y_lower, float x_destination, float y_destination) {
  if (player.xpos <= X_upper && player.xpos >= X_lower) {
    if (player.ypos <= Y_upper && player.ypos >= Y_lower) {
      player.size = sizeChangeAmount;
      player.sizeChange = timer(time);

      if (player.sizeChange == true) {
        player.size = 7;
        player.xpos = x_destination;
        player.ypos = y_destination;
        sizeChange = false;
      }
    }
  }
  //  return player.size;
}

public void sizeChanger(Player player, float change, float X_upper, float X_lower, float Y_upper, float Y_lower) {
  if (player.xpos <= X_upper && player.xpos >= X_lower) {
    if (player.ypos <= Y_upper && player.ypos >= Y_lower) {
      player.size = change;
    }
  } else {
    player.size = 7;
  }
}

public void startPlayers( int x, int x_increment, int y, int y_increment) {
  if (stop == false) {
    for (int i = 0; i < 2; i++) {
      Player player = players.get(i);
      y += y_increment;
      x += x_increment;
      player.coordinates(x, y);
      stop = true;
    }
  }
}


public void level_1() {
  startPlayers(25, 0, 40, 10);

  if (displayed == false) {
    setImages("/maps/level1.png", "/maps/level1Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 626, 519, 750, 613); // X1, X2, Y1, Y2
      }
      lap_gate(player, 234, 111, 102, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    slow_gate(player, 750, 680, 461, 129);
    fast_gate(player, 557, 256, 380, 176);
    playerSpeedChange(player);

    player.slow = false;
    player.fast = false;
  }
  level1_winner = level_colour(level1_winner);
}

public void level_2() {
  startPlayers(220, 0, 655, 15);

  if (displayed == false) {
    setImages("/maps/level2.png", "/maps/level2Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 476, 426, 280, 243); // X1, X2, Y1, Y2
      }
      lap_gate(player, 367, 285, 702, 656);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    slow_gate(player, 580, 479, 164, 111);
    fast_gate(player, 567, 427, 98, 31);
    playerSpeedChange(player);

    player.slow = false;
    player.fast = false;
  }
  level2_winner = level_colour(level2_winner);
}

public void level_3() {
  startPlayers(25, 0, 3, 8);

  if (displayed == false) {
    setImages("/maps/level3.png", "/maps/level3Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 308, 214, 710, 650); // X1, X2, Y1, Y2
      }
      lap_gate(player, 140, 45, 37, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    slow_gate(player, 210, 53, 649, 482);    
    fast_gate(player, 53, 0, 710, 595);
    fast_gate(player, 145, 50, 710, 595);
    playerSpeedChange(player);

    if (player.up) {
      bridge(player, 150, 0, 527, 455, 326, 305, player.xpos, 229);
    }
    if (player.down) {
      bridge(player, 150, 0, 527, 455, 245, 220, player.xpos, 317);
    }

    player.slow = false;
    player.fast = false;
    player.prev_x = player.ypos;
  }
  level3_winner = level_colour(level3_winner);
}

public void level_4() {
  startPlayers(590, 20, 225, 0);

  if (displayed == false) {
    setImages("/maps/level4.png", "/maps/level4Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 134, 66, 500, 413); // X1, X2, Y1, Y2
      }
      lap_gate(player, 654, 604, 300, 238);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    slow_gate(player, 238, 134, 548, 503);
    slow_gate(player, 559, 491, 198, 138);
    fast_gate(player, 750, 0, 710, 548);
    fast_gate(player, 750, 0, 102, 0);
    playerSpeedChange(player);

    player.slow = false;
    player.fast = false;
  }
  level4_winner = level_colour(level4_winner);
}

public void level_5() {
  startPlayers(50, 0, 5, 15);

  if (displayed == false) {
    setImages("/maps/level5.png", "/maps/level5Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 366, 263, 710, 649); // X1, X2, Y1, Y2
      }
      lap_gate(player, 202, 101, 61, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    sizeChanger(player, 0, 535, 379, 710, 0);
    sizeChanger(player, 0, 750, 0, 577, 426);
    bridge(player, 75, 7, 609, 596, 24, 0, player.xpos-50, player.ypos);
    bridge(player, 50, 7, 622, 609, 36, 0, player.xpos-50, player.ypos);

    player.prev_y = player.ypos;
  }
  level5_winner = level_colour(level5_winner);
}

public void level_6() {
  startPlayers(50, 0, 5, 20);

  if (displayed == false) {
    setImages("/maps/level6.png", "/maps/level6Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 465, 322, 663, 612); // X1, X2, Y1, Y2
      }
      lap_gate(player, 241, 139, 75, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }
    if (player.right) {
      bridge(player, 0, 7, 750, 720, 75, 0, 27, player.ypos+75);
      bridge(player, 0, 0, 488, 470, 226, 151, player.xpos+90, player.ypos);
      bridge(player, 0, 7, 750, 720, 225, 150, 27, player.ypos+350); 
      bridge(player, 0, 7, 750, 720, 575, 500, 27, player.ypos+95); 
      bridge(player, 0, 7, 160, 133, 700, 598, player.xpos+500, player.ypos); 
    }
    if (player.left) {
      bridge(player, 0, 7, 26, 0, 150, 75, 719, player.ypos-75);
      bridge(player, 0, 0, 583, 567, 226, 151, player.xpos-100, player.ypos);
      bridge(player, 0, 7, 26, 0, 575, 500, 719, player.ypos-350); 
      bridge(player, 0, 7, 26, 0, 710, 590, 719, 539); 
      bridge(player, 0, 7, 625, 600, 700, 598, player.xpos-500, player.ypos);
    }
    if (player.down) {
      bridge(player, 0, 7, 133, 27, 710, 683, player.xpos+600, 598);
      bridge(player, 0, 7, 750, 625, 710, 689, player.xpos-300, 504);
      bridge(player, 0, 7, 464, 320, 710, 684, player.xpos-300, 600);
    }
    if (player.up) {
      bridge(player, 0, 7, 750, 625, 597, 578, player.xpos-600, 682);
      bridge(player, 0, 7, 462, 323, 501, 481, player.xpos+300, 687);
      bridge(player, 0, 7, 132, 27, 599, 577, player.xpos+300, 677);
    }
    bridge(player, 0, 7, 463, 322, 593, 578, 50, 15);

    player.prev_x = player.xpos;
    player.prev_x = player.ypos;
  }
  level6_winner = level_colour(level6_winner);
}

public void level_7() {
  startPlayers(25, 0, 20, 30);

  if (displayed == false) {
    setImages("/maps/level7.png", "/maps/level7Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 422, 334, 410, 301); // X1, X2, Y1, Y2
      }
      lap_gate(player, 263, 101, 100, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }
    bridge(player, 0, 7, 450, 422-player.size, 388, 328-player.size, 20, 20);
    bridge(player, 0, 7, 304, 285-player.size, 264, 210-player.size, 20, 20);
    bridge(player, 0, 7, 364, 335-player.size, 295, 271-player.size, 20, 20);
    bridge(player, 0, 7, 528, 441-player.size, 276, 216-player.size, 20, 20);
    bridge(player, 0, 7, 535, 496-player.size, 410, 348-player.size, 20, 20);
    bridge(player, 0, 7, 528, 460-player.size, 496, 431-player.size, 20, 20);
    bridge(player, 0, 7, 432, 332-player.size, 479, 413-player.size, 20, 20);
  }
  level7_winner = level_colour(level7_winner);
}

public void level_8() {
  startPlayers(25, 0, 10, 10);

  if (displayed == false) {
    setImages("/maps/level8.png", "/maps/level8Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 478, 396, 750, 659); // X1, X2, Y1, Y2
      }
      lap_gate(player, 164, 91, 66, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    if (player.checkpoint == true) {
      bridge(player, 0, 7, 658, 87-player.size, 250, 69-player.size, 500, 684);
      bridge(player, 0, 7, 522, 336-player.size, 456, 200-player.size, 500, 684);
      bridge(player, 0, 7, 394, 186-player.size, 653, 459-player.size, 500, 684);
      bridge(player, 0, 7, 750, 600-player.size, 605, 312-player.size, 500, 684);
      bridge(player, 0, 7, 750, 459-player.size, 605, 515-player.size, 500, 684);
      bridge(player, 0, 7, 262, 0-player.size, 390, 286-player.size, 500, 684);
      bridge(player, 0, 7, 80, 0-player.size, 710, 390-player.size, 500, 684);
      bridge(player, 0, 7, 656, 388-player.size, 654, 649-player.size, 500, 684);
      bridge(player, 0, 7, 750, 0-player.size, 5, 0-player.size, 500, 684);
      bridge(player, 0, 7, 750, 0-player.size, 710, 705-player.size, 500, 684);
      bridge(player, 0, 7, 5, 0-player.size, 710, 0-player.size, 500, 684);
      bridge(player, 0, 7, 750, 745-player.size, 710, 0-player.size, 500, 684);
    }
    if (player.checkpoint == false) {
      bridge(player, 0, 7, 658, 87-player.size, 250, 69-player.size, 70, 34);
      bridge(player, 0, 7, 522, 336-player.size, 456, 200-player.size, 70, 34);
      bridge(player, 0, 7, 394, 186-player.size, 653, 459-player.size, 70, 34);
      bridge(player, 0, 7, 750, 600-player.size, 605, 312-player.size, 70, 34);
      bridge(player, 0, 7, 750, 459-player.size, 605, 515-player.size, 70, 34);
      bridge(player, 0, 7, 262, 0-player.size, 390, 286-player.size, 70, 34);
      bridge(player, 0, 7, 80, 0-player.size, 710, 390-player.size, 70, 34);
      bridge(player, 0, 7, 656, 388-player.size, 654, 649-player.size, 70, 34);
      bridge(player, 0, 7, 750, 0-player.size, 5, 0-player.size, 70, 34);
      bridge(player, 0, 7, 750, 0-player.size, 710, 705-player.size, 70, 34);
      bridge(player, 0, 7, 5, 0-player.size, 710, 0-player.size, 70, 34);
      bridge(player, 0, 7, 750, 745-player.size, 710, 0-player.size, 70, 34);
    }

    player.slow = false;
    player.fast = false;
  }
  level8_winner = level_colour(level8_winner);
}

public void level_9() {
  startPlayers(25, 0, 10, 20);

  if (displayed == false) {
    setImages("/maps/level9.png", "/maps/level9Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 400, 318, 705, 648); // X1, X2, Y1, Y2
      }
      lap_gate(player, 230, 111, 78, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }
  }

  if (colours1 == false) {
    doLights(1);
  }
  if (colours1 == true) {
    doLights(-1);
  }
  if (lightColours >= 255) {
    colours1 = true;
  }
  if (lightColours <= 0) {
    colours1 = false;
  }

  pushMatrix();
  ellipseMode(TOP);
  fill(0, 0, 0, 230);
  rect(0, 0, 750, 710);
  fill(lightColours, lightColours, lightColours, 100);
  circle(6, 6, 150);
  circle(475, 25, 250);
  circle(75, 140, 200);
  circle(349, 549, 200);
  circle(25, 575, 150);
  popMatrix();

  level9_winner = level_colour(level9_winner);  //LEVEL 10 have holes that you fall down.
}

public void level_10() {
  startPlayers(35, 0, 7, 13);

  if (displayed == false) {
    setImages("/maps/level10.png", "/maps/level10Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    if (player.lap_count != 5) {
      if (player.checkpoint == false) {
        checkpoint_gate(player, 445, 393, 272, 217); // X1, X2, Y1, Y2
      }
      lap_gate(player, 188, 111, 146, 0);
      if (player.lap) {
        player.checkpoint = false;
        player.lap = false;
        player.lap_count += 1;
      }
    }

    bridge(player, 0, 7, 750, 699-player.size, 30, 0-player.size, 711, 372);
    bridge(player, 0, 7, 750, 702-player.size, 285, 190-player.size, 719, 604);
    bridge(player, 0, 7, 548, 446-player.size, 271, 249-player.size, 493, 604);
    bridge(player, 0, 7, 302, 187-player.size, 95, 60-player.size, 240, 450);
    bridge(player, 0, 7, 117, 76-player.size, 330, 311-player.size, 97, 677);
    bridge(player, 0, 7, 51, 39-player.size, 272, 206-player.size, 42, 580);
    bridge(player, 0, 7, 27, 0-player.size, 191, 108-player.size, 15, 500);
  
    if (player.checkpoint == true) {
      bridge(player, 0, 7, 159, 115-player.size, 404, 356-player.size, 418, 235);
    }
    if (player.checkpoint == false) {
      bridge(player, 0, 7, 159, 115-player.size, 404, 356-player.size, 184, 26);
    }
  }
  pushMatrix();
  ellipseMode(TOP);
  fill(0, 0, 0, 200);
  rect(0, 355, 750, 710);
  fill(100, 100, 100, 100);
  circle(190, 400, 100);
  circle(60, 640, 75);
  circle(670, 560, 100);
  circle(695, 355, 50);
  rect(6, 460, 24, 89);
  rect(39, 557, 13, 69);
  circle(442, 561, 100);
  popMatrix();

  level10_winner = level_colour(level10_winner);
}

public void movement(PImage collisionImage, PImage displayImage, Player player)
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
          int pixelColor = collisionImage.pixels[y*collisionImage.width+x];
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

class Player {
  float xpos = 0;
  float ypos = 0;

  boolean colour = false;
  boolean colours = false;
  boolean checkpoint = false;
  boolean slow = false;
  boolean fast = false;

  int playerColour;
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

  Player(boolean keys, int colour, String name1) {
    wasd = keys;
    playerColour = colour;
    name = name1;
  }

  public void coordinates(float startCoordsX, float startCoordsY) {
    xpos = startCoordsX;
    ypos = startCoordsY;
  }
}

public void show(Player player) {
  fill(player.playerColour);
  rect(player.xpos, player.ypos, player.size, player.size);
}

  public void settings() {  size(750, 710); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RacingGameBetter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
