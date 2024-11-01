int cols = 16; // Aantal kolommen
int rows = 16; // Aantal rijen
int cellSize = 50; // Grootte van elk blokje

int S = 7; // Slechte overvaller random replacer
boolean hitBadRaiderOnce = false; // Controleer of score al gehalveerd is bij botsing
boolean[][] collectedTreasures = new boolean[rows][cols]; // Houdt bij welke schatten zijn verzameld

int[][] grid = { // Positie van elementen op grid, 90 graden gedraaid
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 0, S, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1},
  {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1},
  {1, 0, 0, 1, 0, 0, 3, 1, 0, S, 1, 0, 0, 0, 3, 1},
  {1, 0, 0, 0, 0, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 1},
  {1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
  {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1},
  {1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1},
  {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, S, 1},
  {1, 0, 1, 0, 0, 0, S, 1, 1, 0, 0, 0, 0, 0, 0, 1},
  {1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1},
  {1, 0, 1, 0, 0, 0, S, 1, 1, 0, 1, 0, 0, 6, 0, 1},
  {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

void replaceRandomSWithBadRaider() { // Willekeurige slechte overvaller plaatsing
  int badRaiderCount = 0;

  for (int i = 0; i < rows && badRaiderCount < 5; i++) {
    for (int j = 0; j < cols && badRaiderCount < 5; j++) {
      if (grid[i][j] == S && random(1) < 0.5) { // 50% kans om S te vervangen
        grid[i][j] = 3; // Vervang S met 3
        badRaiderCount++;
      }
    }
  }
}

void replaceRandom0WithTreasure() { // Willekeurige schat plaatsing
  int treasureCount = 0;

  for (int i = 0; i < rows && treasureCount < 30; i++) {
    for (int j = 0; j < cols && treasureCount < 30; j++) {
      if (grid[i][j] == 0 && random(1) < 0.2) { // 20% kans om 0 te vervangen
        grid[i][j] = 2; // Vervang 0 met 2
        treasureCount++;
      }
    }
    for (int j = 0; j < cols && treasureCount < 10; j++) {
      if (grid[i][j] == 0 && random(1) < 0.08) { // 8% kans om 0 te vervangen
        grid[i][j] = 7; // Vervang 0 met 2
        treasureCount++;
      }
    }
  }
}

int gamePlayerSize = 50; // Grootte speler
int xGamePlayerPos = 50; // Begin x-positie speler
int yGamePlayerPos = 50; // Begin y-positie speler
int gamePlayerSpeed = 10; // Snelheid van speler

boolean movingUp = false; // Speler beweegt niet bij begin
boolean movingDown = false; // Speler beweegt niet bij begin
boolean movingLeft = false; // Speler beweegt niet bij begin
boolean movingRight = false; // Speler beweegt niet bij begin

boolean moving = false; // Houdt bij of de speler beweegt
int score1 = 0; // Score van de speler

void setup() {
  size(1200, 800); // Grootte scherm
  replaceRandomSWithBadRaider(); // Veranderd S met 3
  replaceRandom0WithTreasure(); // Veranderd 0 met 2
}
