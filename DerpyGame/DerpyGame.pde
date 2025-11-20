import fisica.*;

FWorld world;

FPoly cornhole1;
FPoly cornhole2;

FCircle bag1;
FCircle bag2;

FPoly board;
FPoly floor;

color red = #A43E3B;
color lightBlue = #c0e6f0;
color brown = color(166, 120, 24);


void setup() {
  size(800, 800);
  
  //initiate objects
  makeWorld();
  bag1 = new FCircle(50);
  bag2 = new FCircle(50);
  board = new FPoly();
  floor = new FPoly();
  
  // finish setting up objects
  makeCircle(bag1);
  makeCircle(bag2);
  makeBoard(board);
  makeFloor(floor);
}

void draw() {

  background(lightBlue);
  println(world);

  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
