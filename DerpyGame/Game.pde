void game() {
  background(lightBlue);

  textAlign(CENTER);
  textSize(25);
  fill(black);
  stroke(black);
  strokeWeight(5);
  text("Red: " + score1, 100, 100);
  text("Blue: " + score2, 200, 100);

  if (score1 == 3 || score2 == 3) {
    mode = GAMEOVER;
  }

  line(700, 100, 700, 400); // base line

  stroke(brightRed);
  strokeWeight(5);
  line(750, 250, 800, 250); //indicator where to hit
  strokeWeight(5);

  stroke(brightRed);
  line(700, sliderY, 720, sliderY); //controlable

  if (sliderGoingDown && !spacekeyHit) {
    sliderY += 7;
  }
  if (!sliderGoingDown && !spacekeyHit) {
    sliderY -= 7;
  }
  if ((sliderY > 400 || sliderY < 100) && !spacekeyHit) sliderGoingDown = !sliderGoingDown;

  float vx = map(sliderY, 100, 400, -460, -790);
  float vy = map(sliderY, 100, 400, -430, -840);

  // PLAYERSSSSSSSSSSSSSSSSSSSSSS

  if (spacekey && isPlayer1) {
    bag1.setVelocity(vx, vy);
    ballThrown = true;
  }

  if (isPlayer1) {
    if (bag1.isTouchingBody(goal)) {
      score1++;
      bag2.setPosition(700, 650);
      bag1.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = false;
    }

    if (ballThrown && (abs(bag1.getVelocityX()) < 0.5 || bag1.isTouchingBody(backboard) || bag1.isTouchingBody(floor))) { //check if it goes backwards
      bag2.setPosition(700, 650);
      bag1.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = false;
    }
  }

  // PLAYER 22222222222222222222222222222222222222

  println(isPlayer1, ballThrown);

  if (spacekey && !isPlayer1) {
    bag2.setVelocity(vx, vy);
    ballThrown = true;
  }
  if (!isPlayer1) {
    if (bag2.isTouchingBody(goal)) {
      score2++;
      bag1.setPosition(700, 650);
      bag2.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = true;
    }

    if (ballThrown && (abs(bag2.getVelocityX()) < 0.5 || bag2.isTouchingBody(backboard) || bag2.isTouchingBody(floor))) { //check if it goes backwards
      bag1.setPosition(700, 650);
      bag2.setPosition(785, 685);
      ballThrown = false;
      spacekey = false;
      spacekeyHit = !spacekeyHit;
      sliderY = 100;
      isPlayer1 = true;
    }
  }



  world.step();
  world.draw();
}
