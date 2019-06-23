
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

void lap_gate(Player player, float lap_X_upper, float lap_X_lower, float lap_Y_upper, float lap_Y_lower) {
  if (player.lap == false && player.checkpoint == true) {
    if (player.xpos <= lap_X_upper && player.xpos >= lap_X_lower) {
      if (player.ypos <= lap_Y_upper && player.ypos >= lap_Y_lower) {
        player.lap = true;
      }
    }
  }
}

void checkpoint_gate(Player player, float check_X_upper, float check_X_lower, float check_Y_upper, float check_Y_lower) {
  if (player.checkpoint == false) {
    if (player.xpos <= check_X_upper && player.xpos >= check_X_lower) {
      if (player.ypos <= check_Y_upper && player.ypos >= check_Y_lower) {
        player.checkpoint = true;
      }
    }
  }
}

void slow_gate(Player player, float slow_X_upper, float slow_X_lower, float slow_Y_upper, float slow_Y_lower) {
  if (player.xpos <= slow_X_upper && player.xpos >= slow_X_lower) {
    if (player.ypos <= slow_Y_upper && player.ypos >= slow_Y_lower) {
      player.slow = true;
    }
  }
}

void fast_gate(Player player, float fast_X_upper, float fast_X_lower, float fast_Y_upper, float fast_Y_lower) {
  if (player.xpos <= fast_X_upper && player.xpos >= fast_X_lower) {
    if (player.ypos <= fast_Y_upper && player.ypos >= fast_Y_lower) {
      player.fast = true;
    }
  }
}

void playerSpeedChange(Player player) {
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
    player.speed = 1.5;
  }
}

boolean timer(float millis) {
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

void bridge(Player player, float time, float sizeChangeAmount, float X_upper, float X_lower, float Y_upper, float Y_lower, float x_destination, float y_destination) {
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

void sizeChanger(Player player, float change, float X_upper, float X_lower, float Y_upper, float Y_lower) {
  if (player.xpos <= X_upper && player.xpos >= X_lower) {
    if (player.ypos <= Y_upper && player.ypos >= Y_lower) {
      player.size = change;
    }
  } else {
    player.size = 7;
  }
}

void startPlayers( int x, int x_increment, int y, int y_increment) {
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
