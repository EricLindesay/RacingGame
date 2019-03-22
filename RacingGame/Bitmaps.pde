void displayLaps(int x, int y) {
  textSize(15);
  fill(player1);
  text("Player 1: " + int(lap_count1) + " laps", x, y);
  fill(player2);
  text("Player 2: " + int(lap_count2) + " laps", x, y + 15);
}

void colourBox() {
  strokeWeight(3);
  fill(player1);
  rect(20, 510, 335, 180);
  fill(player2);
  rect(395, 510, 335, 180);
  
  fill(0);
  textSize(40);
  text("Player 1 \n(Arrows) \nColour", 60, 550);
  text("Player 2 \n(WASD) \nColour", 425, 550);
  strokeWeight(1);
}

void colourWinner(String level_winner, int x_coord, int y_coord) {
  if (level_winner == "Player2") {
    fill(player2);
  }
  if (level_winner == "Player1") {
    fill(player1);
  } 
  if (level_winner == "") {
    fill(255);
  }
  if (level_winner != "") {
    rect(x_coord, y_coord, 373, 138);
  }
}

void print_level_select() {
  fill(0);
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
  textSize(100);
  if (lap_count1 >= 5 && finished2 != true) {
    fill(player1);
    text("Player 1 Wins!", 75, 300);    
    finished1 = true;  
    print_levels = true;
    menu = true;
  }

  if (lap_count2 >= 5 && finished1 != true) {
    fill(player2);
    text("Player 2 Wins!", 75, 300);   
    finished2 = true;
    print_levels = true;
    menu = true;
  }
}
