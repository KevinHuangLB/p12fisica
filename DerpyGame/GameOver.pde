void gameOver() {
  background(black);

  if (score1 == 3) {
    fill(red);
    text("RED WINS " + score1 + "-" + score2, 400, 400);
    text("CLICK TO RESTART", 400, 600);
  }
  if (score2 == 3) {
    fill(blue);
    text("BLUE WINS " + score2 + "-" + score1, 400, 400);
    text("CLICK TO RESTART", 400, 600);
  }
}
void gameOverClicks() {
  mode = GAME;
  bag1.setPosition(700, 650);
  bag1.setVelocity(0,0);
  bag2.setPosition(785, 685);
  ballThrown = false;
  spacekey = false;
  spacekeyHit = false;
  sliderY = 100;
  isPlayer1 = true;
  score1 = 0;
  score2 = 0; 
}
