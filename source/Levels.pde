
void level_1() {
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

void level_2() {
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

void level_3() {
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

void level_4() {
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

void level_5() {
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

void level_6() {
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

void level_7() {
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

void level_8() {
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

void level_9() {
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

void level_10() {
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
