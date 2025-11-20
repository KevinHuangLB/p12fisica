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
  circle.setPosition(random(100, width-100), -600);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

void makeBoard(FPoly board) {

  //plot the vertices of this platform
  board.vertex(300, 480);
  board.vertex(350, 480);
  board.vertex(350, 550);
  board.vertex(550, 550);
  board.vertex(550, 480);
  board.vertex(600, 480);
  board.vertex(600, 580);
  board.vertex(300, 580);

  // define properties
  board.setStatic(true);
  board.setFillColor(brown);
  board.setFriction(0);

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
  floor.setGrabbable(false);
  floor.setFriction(0);

  //put it in the world
  world.add(floor);
}
