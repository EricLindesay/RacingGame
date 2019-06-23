void displayLaps(int x, int y) {
  for (int i = 0; i < 2; i++) {
    Player player = players.get(i);
    textSize(15);
    fill(player.playerColour);
    text("Player "+(i+1)+": " + int(player.lap_count) + " laps", x, y);
    y = y + 15;
  }
}

void colourBox() {
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
void colourWinner(String level_winner, int x_coord, int y_coord) {
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

void print_level_select() {
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

void countdown(PImage image) {
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

void laps_finished() {
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
