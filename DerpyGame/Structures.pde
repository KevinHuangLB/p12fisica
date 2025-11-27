void makeBlob(FBlob blob) {
  //set visuals
  blob.setAsCircle(random(100, width-100), 700, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(red);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

void makeCircle(FCircle circle) {
  circle.setPosition(700, 650);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.5);
  circle.setFriction(1);
  circle.setRestitution(0.2);
  circle.setGrabbable(false);

  //add to world
  world.add(circle);
}

void makeCircle2(FCircle circle) {
  circle.setPosition(785, 685);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(blue);

  //set physical properties
  circle.setDensity(0.5);
  circle.setFriction(1);
  circle.setRestitution(0.3);
  circle.setGrabbable(false);

  //add to world
  world.add(circle);
}

void makeBoard(FPoly board) {

  //plot the vertices of this platform
  board.vertex(0, 600);
  board.vertex(25, 600);
  board.vertex(40, 660);
  board.vertex(40, 700);
  board.vertex(75, 700);
  board.vertex(75, 660);
  board.vertex(100, 610);
  board.vertex(300, 670);
  board.vertex(300, 700);
  board.vertex(0, 700);

  // define properties
  board.setStatic(true);
  board.setFillColor(brown);
  board.setStrokeWeight(0);
  board.setGrabbable(false);
  board.setFriction(1);
  board.setRestitution(0);

  //put it in the world
  world.add(board);
}

void makeFloor(FPoly floor) {

  //plot the vertices of this platform
  floor.vertex(0, 700);
  floor.vertex(800, 700);
  floor.vertex(800, 800);
  floor.vertex(0, 800);

  // define properties
  floor.setStatic(true);
  floor.setFillColor(brown);
  floor.setStrokeWeight(0);
  floor.setGrabbable(false);
  floor.setFriction(0);

  //put it in the world
  world.add(floor);
}

void makeBagStand(FPoly bagStand) {

  //plot the vertices of this platform
  bagStand.vertex(650, 700);
  bagStand.vertex(650, 670);
  bagStand.vertex(750, 670);
  bagStand.vertex(750, 700);

  // define properties
  bagStand.setStatic(true);
  bagStand.setFillColor(brown);
  bagStand.setGrabbable(false);
  bagStand.setFriction(0);

  //put it in the world
  world.add(bagStand);
}

void makeBackboard(FPoly backboard) {

  //plot the vertices of this platform
  backboard.vertex(-100, 0);
  backboard.vertex(0, 0);
  backboard.vertex(0, 800);
  backboard.vertex(-100, 800);

  // define properties
  backboard.setStatic(true);
  backboard.setFillColor(brown);
  backboard.setGrabbable(false);
  backboard.setFriction(0);

  //put it in the world
  world.add(backboard);
}
void makeBlocker(FPoly blocker) {

  //plot the vertices of this platform
  blocker.vertex(800, 0);
  blocker.vertex(900, 0);
  blocker.vertex(900, 800);
  blocker.vertex(800, 800);

  // define properties
  blocker.setStatic(true);
  blocker.setFillColor(brown);
  blocker.setGrabbable(false);
  blocker.setFriction(0);

  //put it in the world
  world.add(blocker);
}

void makeGoal(FPoly goal) {

  //plot the vertices of this platform
  goal.vertex(40, 660);
  goal.vertex(75, 660);
  goal.vertex(75, 700);
  goal.vertex(40, 700);

  // define properties
  goal.setStatic(true);
  goal.setFillColor(brown);
  goal.setStrokeWeight(0);
  goal.setGrabbable(false);
  goal.setFriction(1);
  goal.setRestitution(0);

  //put it in the world
  world.add(goal);
}
