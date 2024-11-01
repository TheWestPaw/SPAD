boolean checkCollision(int x, int y, int objectType) {
  int left = x / cellSize; // Linkerkant van de speler
  int right = (x + gamePlayerSize - 1) / cellSize; // Rechterkant van de speler
  int top = y / cellSize; // Bovenkant van de speler
  int bottom = (y + gamePlayerSize - 1) / cellSize; // Onderkant van de speler

  if (left >= 0 && right < rows && top >= 0 && bottom < cols) { // Controleer of een deel van de speler in een object zit
    if (grid[top][left] == objectType || grid[top][right] == objectType ||
      grid[bottom][left] == objectType || grid[bottom][right] == objectType) {
      return true; // Er is een botsing met het opgegeven objectType
    }
  }
  return false; // Geen botsing
}

void drawGamePlayer() {
  fill(#FF0000); // Speler wordt rood
  square(xGamePlayerPos, yGamePlayerPos, gamePlayerSize);
}

void drawWall(int i, int j) {
  fill(#964B00); // Muur wordt bruin
  square(i * cellSize, j * cellSize, cellSize);
}

void drawTreasure(int i, int j) {
  fill(#FFFF00); // Schat wordt geel
  square(i * cellSize, j * cellSize, cellSize);
}

void drawBadRaider(int i, int j) {
  fill(#FF00FF); // Slechte overvaller wordt roze
  square(i * cellSize, j * cellSize, cellSize);
}

void drawPortal(int i, int j) {
  fill(#550055); // Portaal val wordt paars
  square(i * cellSize, j * cellSize, cellSize);
}

void drawTreasure5(int i, int j) {
  fill(#888800); // Schat wordt geel
  square(i * cellSize, j * cellSize, cellSize);
}

void drawScoreboard(int score) {
  textSize(25); // Grote van scoreboard
  fill(#FFFF00); // Scoreboard wordt geel
  text("Score Player 1: " + score, 850, 400); // Scoreboard speler 1
}
