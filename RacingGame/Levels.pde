 //<>//
void level_1() {
  if (stop == false) {
    playerX = 25;
    playerY = 20;
    playerX2 = 25;
    playerY2 = 50;
    stop = true;
  }


  if (displayed == false) {
    setImages("level1.png", "level1Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 626, 519, 750, 613); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 626, 519, 750, 613);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 234, 111, 102, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 234, 111, 102, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  slow1 = slow_gate(playerX, playerY, slow1, 750, 680, 461, 129);
  slow2 = slow_gate(playerX2, playerY2, slow2, 750, 680, 461, 129);

  fast1 = fast_gate(playerX, playerY, fast1, 557, 256, 380, 176);
  fast2 = fast_gate(playerX2, playerY2, fast2, 557, 256, 380, 176);

  playerSpeed1 = playerSpeedChange(playerSpeed1, slow1, fast1);
  playerSpeed2 = playerSpeedChange(playerSpeed2, slow2, fast2);

  slow1 = false;
  slow2 = false;
  fast1 = false;
  fast2 = false;

  level1_winner = level_colour(level1_winner);
}

void level_2() {
  if (stop == false) {
    playerX = 200;
    playerY = 665;
    playerX2 = 200;
    playerY2 = 685;
    stop = true;
  }

  if (displayed == false) {
    setImages("level2.png", "level2Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 476, 426, 280, 243); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 476, 426, 280, 243);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 367, 285, 702, 656) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 367, 285, 702, 565) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  slow1 = slow_gate(playerX, playerY, slow1, 580, 479, 164, 111);
  slow2 = slow_gate(playerX2, playerY2, slow2, 580, 479, 164, 111);

  fast1 = fast_gate(playerX, playerY, fast1, 567, 427, 98, 31);
  fast2 = fast_gate(playerX2, playerY2, fast2, 567, 427, 98, 31);

  playerSpeed1 = playerSpeedChange(playerSpeed1, slow1, fast1);
  playerSpeed2 = playerSpeedChange(playerSpeed2, slow2, fast2);

  slow1 = false;
  slow2 = false;
  fast1 = false;
  fast2 = false;

  level2_winner = level_colour(level2_winner);
}

void level_3() {
  if (stop == false) {
    playerX = 25;
    playerY = 7;
    playerX2 = 25;
    playerY2 = 23;
    stop = true;
  }

  if (displayed == false) {
    setImages("level3.png", "level3Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 308, 214, 710, 650); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 308, 214, 710, 650);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 140, 45, 37, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 140, 45, 37, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  slow1 = slow_gate(playerX, playerY, slow1, 210, 53, 649, 482);
  slow2 = slow_gate(playerX2, playerY2, slow2, 210, 53, 649, 482);

  fast1 = fast_gate(playerX, playerY, fast1, 53, 0, 710, 595);
  fast2 = fast_gate(playerX2, playerY2, fast2, 53, 0, 710, 595);
  fast1 = fast_gate(playerX, playerY, fast1, 145, 50, 710, 595);
  fast2 = fast_gate(playerX2, playerY2, fast2, 145, 50, 710, 595);

  playerSpeed1 = playerSpeedChange(playerSpeed1, slow1, fast1);
  playerSpeed2 = playerSpeedChange(playerSpeed2, slow2, fast2);

  if (prev_y >= playerY) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 250, 0, 527, 455, 316, 306, playerX, 229);
  }
  if (prev_y <= playerY) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 250, 0, 527, 455, 240, 230, playerX, 317);
  }
  if (prev_y2 >= playerY2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 250, 0, 527, 455, 316, 306, playerX2, 229);
  }
  if (prev_y2 <= playerY2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 250, 0, 527, 455, 240, 230, playerX2, 317);
  }

  slow1 = false;
  slow2 = false;
  fast1 = false;
  fast2 = false;

  level3_winner = level_colour(level3_winner);

  prev_y = playerY;
  prev_y2 = playerY2;
}

void level_4() {
  if (stop == false) {
    playerX = 615;
    playerY = 225;
    playerX2 = 635;
    playerY2 = 225;
    stop = true;
  }

  if (displayed == false) {
    setImages("level4.png", "level4Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 134, 66, 500, 413); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 134, 66, 500, 413);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 654, 604, 300, 238) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 654, 604, 300, 238) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  slow1 = slow_gate(playerX, playerY, slow1, 238, 134, 548, 503);
  slow2 = slow_gate(playerX2, playerY2, slow2, 238, 134, 548, 503); 
  slow1 = slow_gate(playerX, playerY, slow1, 559, 491, 198, 138);
  slow2 = slow_gate(playerX2, playerY2, slow2, 559, 491, 198, 138);

  fast1 = fast_gate(playerX, playerY, fast1, 750, 0, 710, 548);
  fast2 = fast_gate(playerX2, playerY2, fast2, 750, 0, 710, 548);
  fast1 = fast_gate(playerX, playerY, fast1, 750, 0, 102, 0);
  fast2 = fast_gate(playerX2, playerY2, fast2, 750, 0, 102, 0);

  playerSpeed1 = playerSpeedChange(playerSpeed1, slow1, fast1);
  playerSpeed2 = playerSpeedChange(playerSpeed2, slow2, fast2);

  slow1 = false;
  slow2 = false;
  fast1 = false;
  fast2 = false;

  level4_winner = level_colour(level4_winner);
}

void level_5() {
  if (stop == false) {
    playerX = 50;
    playerY = 15;
    playerX2 = 50;
    playerY2 = 40;
    stop = true;
  }

  if (displayed == false) {
    setImages("level5.png", "level5Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 366, 263, 710, 649); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 366, 263, 710, 649);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 202, 101, 61, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 202, 101, 61, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  playerSize = sizeChanger(playerX, playerY, playerSize, 0, 535, 379, 710, 0);
  playerSize = sizeChanger(playerX, playerY, playerSize, 0, 750, 0, 577, 426);
  playerSize2 = sizeChanger(playerX2, playerY2, playerSize2, 0, 535, 379, 710, 0);
  playerSize2 = sizeChanger(playerX2, playerY2, playerSize2, 0, 750, 0, 577, 426);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 75, 7, 609, 596, 24, 0, playerX-50, playerY);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 75, 7, 609, 596, 24, 0, playerX2-50, playerY2);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 50, 7, 622, 609, 36, 0, playerX-50, playerY);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 50, 7, 622, 609, 36, 0, playerX2-50, playerY2);

  level5_winner = level_colour(level5_winner);

  prev_y = playerY;
  prev_y2 = playerY2;
}

void level_6() {
  if (stop == false) {
    playerX = 50;
    playerY = 15;
    playerX2 = 50;
    playerY2 = 50;
    stop = true;
  }

  if (displayed == false) {
    setImages("level6.png", "level6Detail.png");
  }

  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 465, 322, 663, 612); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 465, 322, 663, 612);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 241, 139, 75, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 241, 139, 75, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }



  if (prev_x <= playerX) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 720, 75, 0, 27, playerY+75);//RED1
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 0, 488, 470, 226, 151, playerX+90, playerY);// GREY1
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 720, 225, 150, 27, playerY+350); //lightBlue1
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 720, 575, 500, 27, playerY+95); //lightBlue1
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 160, 133, 700, 598, playerX+500, playerY); //lightBlue1
  }
  if (prev_x >= playerX) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 26, 0, 150, 75, 719, playerY-75); //RED2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 0, 583, 567, 226, 151, playerX-90, playerY);// GREY2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 26, 0, 575, 500, 719, playerY-350); //LIGHTBLUE2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 26, 0, 710, 590, 719, 539); //LIGHTBLUE2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 625, 600, 700, 598, playerX-500, playerY); //lightBlue1
  }
  if (prev_x2 <= playerX2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 720, 75, 0, 27, playerY2+75); // RED1
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 0, 488, 470, 226, 151, playerX2+90, playerY2);// GREY1
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 720, 225, 150, 27, playerY2+350); //lightBlue1
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 720, 575, 500, 27, playerY2+75); //lightBlue1
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 160, 133, 700, 598, playerX2+500, playerY2); //lightBlue1
  }
  if (prev_x2 >= playerX2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 25, 0, 150, 75, 719, playerY2-75);// RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 0, 583, 567, 226, 151, playerX2-90, playerY2);// GREY2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 26, 0, 575, 500, 719, playerY2-350); //RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 26, 0, 710, 590, 719, playerY2-75); //LIGHTBLUE2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 625, 600, 700, 598, playerX2-500, playerY2); //lightBlue1
  }
  if (prev_y <= playerY) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 133, 27, 710, 683, playerX+600, 598);// RED2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 625, 710, 689, playerX-300, 504);// RED2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 464, 320, 710, 684, playerX-300, 600);// RED2
  }
  if (prev_y >= playerY) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 625, 597, 578, playerX-600, 682);// RED2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 462, 323, 501, 481, playerX+300, 687);// RED2
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 132, 27, 599, 577, playerX+300, 677);// RED2
  }
  if (prev_y2 <= playerY2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 133, 27, 710, 683, playerX2+600, 598);// RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 625, 710, 689, playerX2-300, 504);// RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 464, 320, 710, 684, playerX2-300, 600);// RED2
  }
  if (prev_y2 >= playerY2) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 625, 597, 578, playerX2-600, 682);// RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 462, 323, 501, 481, playerX2+300, 687);// RED2
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 132, 27, 599, 577, playerX2+300, 677);// RED2
  }
  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 463, 322, 593, 578, 50, 15);// RED2
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 463, 322, 593, 578, 50, 50);// RED2


  level6_winner = level_colour(level6_winner);

  prev_x = playerX;
  prev_x2 = playerX2;
  prev_y = playerY;
  prev_y2 = playerY2;
}

void level_7() {
  if (stop == false) {
    playerX = 25;
    playerY = 20;
    playerX2 = 25;
    playerY2 = 50;
    stop = true;
  }


  if (displayed == false) {
    setImages("level7.png", "level7Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 422, 334, 410, 301); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 422, 334, 410, 301);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 263, 101, 100, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 263, 101, 100, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 450, 422-playerSize, 388, 328-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 450, 422-playerSize2, 388, 328-playerSize2, 20, 20);

  //RED THING
  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 304, 285-playerSize, 264, 210-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 304, 285-playerSize2, 264, 210-playerSize2, 20, 20);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 364, 335-playerSize, 295, 271-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 364, 335-playerSize2, 295, 271-playerSize2, 20, 20);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 528, 441-playerSize, 276, 216-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 528, 441-playerSize2, 276, 216-playerSize2, 20, 20);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 535, 496-playerSize, 410, 348-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 535, 496-playerSize2, 410, 348-playerSize2, 20, 20);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 528, 460-playerSize, 496, 431-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 528, 460-playerSize2, 496, 431-playerSize2, 20, 20);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 432, 332-playerSize, 479, 413-playerSize, 20, 20);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 432, 332-playerSize2, 479, 413-playerSize2, 20, 20);

  level7_winner = level_colour(level7_winner);
}

void level_8() {
  if (stop == false) {
    playerX = 25;
    playerY = 20;
    playerX2 = 25;
    playerY2 = 50;
    stop = true;
  }


  if (displayed == false) {
    setImages("level8.png", "level8Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 478, 396, 750, 659); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 478, 396, 750, 659);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 164, 91, 66, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 164, 91, 102, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  if (checkpoint1 == true) {
    //teleport player 1 to checkpoint
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 658, 87-playerSize, 250, 69-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 522, 336-playerSize, 456, 200-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 394, 186-playerSize, 653, 459-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 600-playerSize, 605, 312-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 459-playerSize, 605, 515-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 262, 0-playerSize, 390, 286-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 80, 0-playerSize, 710, 390-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 656, 388-playerSize, 654, 649-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 0-playerSize, 5, 0-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 0-playerSize, 710, 705-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 5, 0-playerSize, 710, 0-playerSize, 500, 684);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 745-playerSize, 710, 0-playerSize, 500, 684);
  }
  if (checkpoint2 == true) {
    //teleport player 2 to checkpoint
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 658, 87-playerSize2, 250, 69-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 522, 336-playerSize2, 456, 200-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 394, 186-playerSize2, 653, 459-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 600-playerSize2, 605, 312-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 459-playerSize2, 605, 515-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 262, 0-playerSize2, 390, 286-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 80, 0-playerSize2, 710, 390-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 656, 388-playerSize2, 654, 649-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 0-playerSize2, 5, 0-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 0-playerSize2, 710, 705-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 5, 0-playerSize2, 710, 0-playerSize2, 500, 684);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 745-playerSize2, 710, 0-playerSize2, 500, 684);
  }
  if (checkpoint1 == false) {
    //teleport player 1 to lap gate
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 658, 87-playerSize, 250, 69-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 522, 336-playerSize, 456, 200-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 394, 186-playerSize, 653, 459-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 600-playerSize, 605, 312-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 459-playerSize, 605, 515-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 262, 0-playerSize, 390, 286-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 80, 0-playerSize, 710, 390-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 656, 388-playerSize, 654, 649-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 0-playerSize, 5, 0-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 0-playerSize, 710, 705-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 5, 0-playerSize, 710, 0-playerSize, 70, 34);
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 745-playerSize, 710, 0-playerSize, 70, 34);
  }
  if (checkpoint2 == false) {
    //teleport player 2 to lap gate
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 658, 87-playerSize2, 250, 69-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 522, 336-playerSize2, 456, 200-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 394, 186-playerSize2, 653, 459-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 600-playerSize2, 605, 312-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 459-playerSize2, 605, 515-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 262, 0-playerSize2, 390, 286-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 80, 0-playerSize2, 710, 390-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 656, 388-playerSize2, 654, 649-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 0-playerSize2, 5, 0-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 0-playerSize2, 710, 705-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 5, 0-playerSize2, 710, 0-playerSize2, 70, 34);
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 745-playerSize2, 710, 0-playerSize2, 70, 34);
  }

  slow1 = false;
  slow2 = false;
  fast1 = false;
  fast2 = false;

  level8_winner = level_colour(level8_winner);
}

void level_9() {
  if (stop == false) {
    playerX = 25;
    playerY = 20;
    playerX2 = 25;
    playerY2 = 50;
    stop = true;
  }

  if (displayed == false) {
    setImages("level9.png", "level9Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 400, 318, 705, 648); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 400, 318, 705, 648);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 230, 111, 78, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 230, 136, 78, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  //  lightColours = timerColours(lightColours, 100);

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

void level_10() {
  if (stop == false) {
    playerX = 35;
    playerY = 13;
    playerX2 = 35;
    playerY2 = 33;
    stop = true;
  }

  if (displayed == false) {
    setImages("level10.png", "level10Detail.png");
  }
  if (countdown == false) { 
    countdown(displayImage);
  }

  if (lap_count1 != 5 || lap_count2 != 5) {
    if (checkpoint1 == false) {
      checkpoint1 = checkpoint_gate(playerX, playerY, checkpoint1, 445, 393, 272, 217); // X1, X2, Y1, Y2
    }
    if (checkpoint2 == false) {
      checkpoint2 = checkpoint_gate(playerX2, playerY2, checkpoint2, 445, 393, 272, 217);
    }
    if (lap_gate(playerX, playerY, lap1, checkpoint1, 188, 111, 146, 0) == true) {
      checkpoint1 = false;
      lap1 = false;
      lap_count1 = lap_count1 + 1;
    }
  }
  if (lap_gate(playerX2, playerY2, lap2, checkpoint2, 188, 111, 146, 0) == true) {
    checkpoint2 = false;
    lap2 = false;
    lap_count2 = lap_count2 + 1;
  }

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 699-playerSize, 30, 0-playerSize, 711, 372);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 699-playerSize2, 30, 0-playerSize2, 711, 372);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 750, 702-playerSize, 285, 190-playerSize, 719, 604);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 750, 702-playerSize2, 285, 190-playerSize2, 719, 604);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 548, 446-playerSize, 271, 249-playerSize, 493, 604);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 548, 446-playerSize2, 271, 249-playerSize2, 493, 604);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 302, 187-playerSize, 95, 60-playerSize, 240, 450);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 302, 187-playerSize2, 95, 60-playerSize2, 240, 450);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 117, 76-playerSize, 330, 311-playerSize, 97, 677);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 117, 76-playerSize2, 330, 311-playerSize2, 97, 677);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 51, 39-playerSize, 272, 206-playerSize, 42, 580);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 51, 39-playerSize2, 272, 206-playerSize2, 42, 580);

  playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 27, 0-playerSize, 191, 108-playerSize, 15, 500);
  playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 27, 0-playerSize2, 191, 108-playerSize2, 15, 500);

  if (checkpoint1 == true) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 159, 115-playerSize, 404, 356-playerSize, 418, 235);
  }
  if (checkpoint2 == true) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 159, 115-playerSize2, 404, 356-playerSize2, 418, 235);
  }
  if (checkpoint1 == false) {
    playerSize = bridge("Player1", playerX, playerY, playerSize, 0, 7, 159, 115-playerSize, 404, 356-playerSize, 184, 26);
  }
  if (checkpoint2 == false) {
    playerSize2 = bridge("Player2", playerX2, playerY2, playerSize2, 0, 7, 159, 115-playerSize2, 404, 356-playerSize2, 184, 26);
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

void doLights(int amount) {
  lightColours = lightColours + amount;
}

int timerColours(int changeAmount, int millis) {
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


String level_colour(String level_winner) {
  if (lap_count1 >= 5 && finished2 != true) {
    level_winner = "Player1";
  }
  if (lap_count2 >= 5 && finished1 != true) {
    level_winner = "Player2";
  }
  return level_winner;
}

boolean lap_gate(float playerX, float playerY, boolean lap, boolean checkpoint, float lap_X_upper, float lap_X_lower, float lap_Y_upper, float lap_Y_lower) {
  if (lap == false && checkpoint == true) {
    if (playerX <= lap_X_upper && playerX >= lap_X_lower) {
      if (playerY <= lap_Y_upper && playerY >= lap_Y_lower) {
        lap = true;
      }
    }
  }
  return lap;
}

boolean checkpoint_gate(float playerX, float playerY, boolean checkpoint, float check_X_upper, float check_X_lower, float check_Y_upper, float check_Y_lower) {
  if (checkpoint == false) {
    if (playerX <= check_X_upper && playerX >= check_X_lower) {
      if (playerY <= check_Y_upper && playerY >= check_Y_lower) {
        checkpoint = true;
      }
    }
  }
  return checkpoint;
}

boolean slow_gate(float playerX, float playerY, boolean slow, float slow_X_upper, float slow_X_lower, float slow_Y_upper, float slow_Y_lower) {
  if (playerX <= slow_X_upper && playerX >= slow_X_lower) {
    if (playerY <= slow_Y_upper && playerY >= slow_Y_lower) {
      slow = true;
    }
  }
  return slow;
}

boolean fast_gate(float playerX, float playerY, boolean fast, float fast_X_upper, float fast_X_lower, float fast_Y_upper, float fast_Y_lower) {
  if (playerX <= fast_X_upper && playerX >= fast_X_lower) {
    if (playerY <= fast_Y_upper && playerY >= fast_Y_lower) {
      fast = true;
    }
  }
  return fast;
}

float playerSpeedChange(float playerSpeed, boolean slow, boolean fast) {
  if (fast == true && slow == true) {
    playerSpeed = 6;
  }
  if (fast == false && slow == false) {
    playerSpeed = 6;
  }
  if (fast == true && slow == false) {
    playerSpeed = 9;
  }
  if (fast == false && slow == true) {
    playerSpeed = 1.5;
  }
  return playerSpeed;
}

boolean timer(float millis, boolean return_value) {
  if (timer == 0) {
    timer = second();
  }
  if (second() - timer == millis) {
    return_value = true;
    timer = 0;
  }
  return return_value;
}

float bridge(String player, float playerX_1, float playerY_1, float playerSizeQ, float time, float sizeChangeAmount, float X_upper, float X_lower, float Y_upper, float Y_lower, float x_destination, float y_destination) {
  if (playerX_1 <= X_upper && playerX_1 >= X_lower) {
    if (playerY_1 <= Y_upper && playerY_1 >= Y_lower) {
      sizeChange = timer(time, sizeChange);
      playerSizeQ = sizeChangeAmount;

      if (sizeChange == true) {
        playerSizeQ = 7;
        if (player == "Player1") {
          playerX = x_destination;
          playerY = y_destination;
        }

        if (player == "Player2") {
          playerX2 = x_destination;
          playerY2 = y_destination;
        }
        sizeChange = false;
      }
    }
  }
  return playerSizeQ;
}

float sizeChanger(float playerX_1, float playerY_1, float playerSizeQ, float change, float X_upper, float X_lower, float Y_upper, float Y_lower) {
  if (playerX_1 <= X_upper && playerX_1 >= X_lower) {
    if (playerY_1 <= Y_upper && playerY_1 >= Y_lower) {
      playerSizeQ = change;
    }
  } else {
    playerSizeQ = 7;
  }
  return playerSizeQ;
}
