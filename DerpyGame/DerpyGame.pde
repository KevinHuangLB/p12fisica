import fisica.*;

FWorld world;

FPoly cornhole1;
FPoly cornhole2;

FCircle bag1;
FCircle bag2;

FPoly board;

color red = #A43E3B;
color lightBlue = #c0e6f0;
color brown = color(166, 120, 24);


void setup() {
  size(800, 800);

  makeWorld();
  bag1 = new FCircle(50);
  bag2 = new FCircle(50);
  board = new FPoly();
  makeCircle(bag1);
  makeCircle(bag2);
  makeBoard(board);
}

void draw() {

  background(lightBlue);


  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

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
