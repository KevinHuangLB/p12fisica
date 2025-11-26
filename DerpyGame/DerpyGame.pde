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
int sliderY;
boolean sliderGoingDown;
boolean spacekeyHit;
float accuracySlider;

//game variables
boolean isPlayer1;

// ball gravity variables
int beginningFrame;

color white = #FFFFFF;
color black = #000000;
color red = #A43E3B;
color lightBlue = #c0e6f0;
color brown = color(166, 120, 24);
color brightRed = #FF000D;
color blue = #3B719F;


void setup() {
  size(800, 800);

  //keyboard variables
  spacekey = false;

  //initiate objects
  makeWorld();
  bag1 = new FCircle(30);
  bag2 = new FCircle(30);
  board = new FPoly();
  floor = new FPoly();
  bagStand = new FPoly();

  // slider variables
  sliderY = 100;
  sliderGoingDown = true;

  //ball gravity variables

  //game variables
  isPlayer1 = true;

  // finish setting up objects
  makeCircle(bag1);
  makeCircle2(bag2);
  makeBoard(board);
  makeFloor(floor);
  makeBagStand(bagStand);
}

void draw() {

  background(lightBlue);
  println(world);

  stroke(black);
  strokeWeight(5);

  line(700, 100, 700, 400); // base line

  stroke(brightRed);
  strokeWeight(5);
  line(750, 250, 800, 250); //indicator where to hit
  strokeWeight(5);

  stroke(brightRed);
  line(700, sliderY, 720, sliderY); //controlable

  if (sliderGoingDown && !spacekeyHit) {
    sliderY += 5;
  }
  if (!sliderGoingDown && !spacekeyHit) {
    sliderY -= 5;
  }
  if ((sliderY >= 400 || sliderY <= 100) && !spacekeyHit) sliderGoingDown = !sliderGoingDown;

  float vx = map(sliderY, 100, 400, -420, -820);
  float vy = map(sliderY, 100, 400, -440, -840);

  if (spacekey && isPlayer1) {
    bag1.setVelocity(vx, vy);

    if (bag1.isTouchingBody(board)) {
      if (bag1.getX() > 24 && bag1.getX() < 94){
        println("YES");
      }
    }
  }
  if (spacekey && !isPlayer1) {
    bag2.setVelocity(vx, vy);
  }

  println(mouseX, mouseY);


  world.step();
  world.draw();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
