import fisica.*;

FWorld world;

FPoly cornhole1;
FPoly cornhole2;

FCircle bag1;
FCircle bag2;

FPoly board;
FPoly floor;
FPoly bagStand;

//keyboard variables
boolean spacekey;

//slider control variables
int sliderY = 100;

color white = #FFFFFF;
color black = #000000;
color red = #A43E3B;
color lightBlue = #c0e6f0;
color brown = color(166, 120, 24);


void setup() {
  size(800, 800);

  //initiate objects
  makeWorld();
  bag1 = new FCircle(30);
  bag2 = new FCircle(30);
  board = new FPoly();
  floor = new FPoly();
  bagStand = new FPoly();

  // finish setting up objects
  makeCircle(bag1);
  //makeCircle(bag2);
  makeBoard(board);
  makeFloor(floor);
  makeBagStand(bagStand);
}

void draw() {

  background(lightBlue);
  println(world);

  stroke(black);
  strokeWeight(10);

  line(700, 100, 700, 400); // base line

  stroke(red);
  line(600, 250, 800, 250); //indicator

  stroke(black);
  circle(700, sliderY, 50); //controlable

// FINISH THIS!!!???!?!?!?!?

  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
