void showWinningScreen() {
  noLoop();
  background(0);
  fill(150);
  rect(390, 335, 370, 100);
  textSize(100);
  fill(#FFFF00); // Eindscherm tekst wordt geel
  text("You won", 400, 415);
}
