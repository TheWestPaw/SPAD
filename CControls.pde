void keyPressed() { // Alle basis controls
  if (key == CODED && !moving) { // Controleer of de speler stilstaat
    if (keyCode == UP) {
      movingUp = true;
      movingDown = false;
      movingLeft = false;
      movingRight = false;
      moving = true;
    } else if (keyCode == DOWN) {
      movingUp = false;
      movingDown = true;
      movingLeft = false;
      movingRight = false;
      moving = true;
    } else if (keyCode == LEFT) {
      movingUp = false;
      movingDown = false;
      movingLeft = true;
      movingRight = false;
      moving = true;
    } else if (keyCode == RIGHT) {
      movingUp = false;
      movingDown = false;
      movingLeft = false;
      movingRight = true;
      moving = true;
    } else if (keyCode == ENTER) {
      loop();
    }
  }
} 
