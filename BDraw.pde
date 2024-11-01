void draw() {
  background(0); // Achtergrond na beweging

  // Teken objecten
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[j][i] == 1) {
        drawWall(i, j);
      } else if (grid[j][i] == 2) {
        drawTreasure(i, j);
      } else if (grid[j][i] == 3) {
        drawBadRaider(i, j);
      } else if (grid[j][i] == 6) {
        drawPortal(i, j);
      } else if (grid[j][i] == 7) {
        drawTreasure5(i, j);
      }
    }
  }

  drawGamePlayer(); // Teken speler

  // Controleer botsing en beweging
  if (movingUp && !checkCollision(xGamePlayerPos, yGamePlayerPos - gamePlayerSpeed, 1)) {
    yGamePlayerPos -= gamePlayerSpeed;
  } else if (movingDown && !checkCollision(xGamePlayerPos, yGamePlayerPos + gamePlayerSpeed, 1)) {
    yGamePlayerPos += gamePlayerSpeed;
  } else if (movingLeft && !checkCollision(xGamePlayerPos - gamePlayerSpeed, yGamePlayerPos, 1)) {
    xGamePlayerPos -= gamePlayerSpeed;
  } else if (movingRight && !checkCollision(xGamePlayerPos + gamePlayerSpeed, yGamePlayerPos, 1)) {
    xGamePlayerPos += gamePlayerSpeed;
  } else {
    moving = false; // Als de speler een muur raakt, reset beweging
  }

  // Controleer botsing met andere objecten
  int playerCol = xGamePlayerPos / cellSize;
  int playerRow = yGamePlayerPos / cellSize;

  if (grid[playerRow][playerCol] == 2 && !collectedTreasures[playerRow][playerCol]) {
    score1 += 1; // Verhoog de score met 1 punt
    grid[playerRow][playerCol] = 0; // Verwijder de schat
    collectedTreasures[playerRow][playerCol] = true; // Markeer schat als verzameld
  }
  if (checkCollision(xGamePlayerPos, yGamePlayerPos, 3)) {
    if (!hitBadRaiderOnce && !moving) {
      score1 /= 2; // Halveer de score één keer bij botsing met badRaider
      hitBadRaiderOnce = true; // Stel in dat er al een botsing was
      grid[playerRow][playerCol] = 0; // Verwijder de slechte overvaller
    }
    if (moving) {
      hitBadRaiderOnce = false;
    }
  }
  if (checkCollision(xGamePlayerPos, yGamePlayerPos, 6)) {
    showWinningScreen();
  }
  if (grid[playerRow][playerCol] == 7 && !collectedTreasures[playerRow][playerCol]) {
    score1 += 5; // Verhoog de score met 1 punt
    grid[playerRow][playerCol] = 0; // Verwijder de schat
    collectedTreasures[playerRow][playerCol] = true; // Markeer schat als verzameld
  }

  int score = score1T(score1);
  drawScoreboard(score); // Update het scoreboard
}

int score1T(int score1R) {
  score1R = score1R;
  return score1R; 
}
